import Flutter
import LinkPresentation
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private var sharePreviewChannel: FlutterMethodChannel?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let didFinish = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    registerSharePreviewChannel()
    return didFinish
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    registerSharePreviewChannel()
  }

  private func registerSharePreviewChannel(retryCount: Int = 0) {
    guard sharePreviewChannel == nil else { return }

    guard let flutterViewController = currentFlutterViewController() else {
      guard retryCount < 10 else { return }

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
        self?.registerSharePreviewChannel(retryCount: retryCount + 1)
      }
      return
    }

    let channel = FlutterMethodChannel(
      name: "digivizit/share_preview",
      binaryMessenger: flutterViewController.binaryMessenger
    )

    channel.setMethodCallHandler { [weak self] call, result in
      guard call.method == "shareBusinessCard" else {
        result(FlutterMethodNotImplemented)
        return
      }

      guard let args = call.arguments as? [String: Any] else {
        result(
          FlutterError(
            code: "invalid_arguments",
            message: "Share arguments are missing.",
            details: nil
          )
        )
        return
      }

      self?.presentBusinessCardShareSheet(arguments: args, result: result)
    }

    sharePreviewChannel = channel
  }

  private func presentBusinessCardShareSheet(
    arguments: [String: Any],
    result: @escaping FlutterResult
  ) {
    let title = (arguments["title"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines)
    let resolvedTitle = (title?.isEmpty == false) ? title! : "QR Kodu"
    let linkUrlString = (arguments["linkUrl"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    let logoUrlString = (arguments["logoUrl"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines)

    guard !linkUrlString.isEmpty else {
      result(
        FlutterError(
          code: "missing_link",
          message: "Share link is empty.",
          details: nil
        )
      )
      return
    }

    let shareURL = URL(string: linkUrlString)

    let presentSheet: (UIImage?) -> Void = { [weak self] logoImage in
      guard let self, let presenter = self.topViewController() else {
        result(
          FlutterError(
            code: "missing_presenter",
            message: "Unable to present share sheet.",
            details: nil
          )
        )
        return
      }

      let itemSource = BusinessCardShareItemSource(
        title: resolvedTitle,
        linkText: linkUrlString,
        linkURL: shareURL,
        logoImage: logoImage
      )

      let activityViewController = UIActivityViewController(
        activityItems: [itemSource],
        applicationActivities: nil
      )

      if let popover = activityViewController.popoverPresentationController {
        popover.sourceView = presenter.view
        popover.sourceRect = CGRect(
          x: presenter.view.bounds.midX,
          y: presenter.view.bounds.midY,
          width: 0,
          height: 0
        )
        popover.permittedArrowDirections = []
      }

      presenter.present(activityViewController, animated: true)
      result(nil)
    }

    guard
      let logoUrlString,
      !logoUrlString.isEmpty,
      let logoURL = URL(string: logoUrlString)
    else {
      DispatchQueue.main.async {
        presentSheet(nil)
      }
      return
    }

    URLSession.shared.dataTask(with: logoURL) { data, _, _ in
      let logoImage = data.flatMap { UIImage(data: $0) }

      DispatchQueue.main.async {
        presentSheet(logoImage)
      }
    }.resume()
  }

  private func currentFlutterViewController() -> FlutterViewController? {
    if let controller = window?.rootViewController as? FlutterViewController {
      return controller
    }

    let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
    let windows = scenes.flatMap { $0.windows }
    return windows.first(where: \.isKeyWindow)?.rootViewController as? FlutterViewController
  }

  private func topViewController(from controller: UIViewController? = nil) -> UIViewController? {
    let rootController = controller ?? currentFlutterViewController()

    if let navigationController = rootController as? UINavigationController {
      return topViewController(from: navigationController.visibleViewController)
    }

    if let tabBarController = rootController as? UITabBarController {
      return topViewController(from: tabBarController.selectedViewController)
    }

    if let presentedController = rootController?.presentedViewController {
      return topViewController(from: presentedController)
    }

    return rootController
  }
}

private final class BusinessCardShareItemSource: NSObject, UIActivityItemSource {
  private let title: String
  private let linkText: String
  private let linkURL: URL?
  private let logoImage: UIImage?

  init(title: String, linkText: String, linkURL: URL?, logoImage: UIImage?) {
    self.title = title
    self.linkText = linkText
    self.linkURL = linkURL
    self.logoImage = logoImage
  }

  func activityViewControllerPlaceholderItem(
    _ activityViewController: UIActivityViewController
  ) -> Any {
    linkURL ?? linkText
  }

  func activityViewController(
    _ activityViewController: UIActivityViewController,
    itemForActivityType activityType: UIActivity.ActivityType?
  ) -> Any? {
    linkURL ?? linkText
  }

  func activityViewController(
    _ activityViewController: UIActivityViewController,
    subjectForActivityType activityType: UIActivity.ActivityType?
  ) -> String {
    title
  }

  @available(iOS 13.0, *)
  func activityViewControllerLinkMetadata(
    _ activityViewController: UIActivityViewController
  ) -> LPLinkMetadata? {
    let metadata = LPLinkMetadata()
    metadata.title = title

    if let linkURL {
      metadata.originalURL = linkURL
      metadata.url = linkURL
    }

    if let logoImage {
      let provider = NSItemProvider(object: logoImage)
      metadata.iconProvider = provider
      metadata.imageProvider = provider
    }

    return metadata
  }
}

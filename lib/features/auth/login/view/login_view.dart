import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/navigation/navigation_extension.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/auth/login/view_model/login_view_model.dart';
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/bottom_sheet/custom_bottom_sheet_view.dart';
import 'package:digivizit/shared/components/buttons/button_properties.dart';
import 'package:digivizit/shared/components/buttons/custom_app_button.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:digivizit/shared/components/hexagon/animated_hexagon_checkbox.dart';
import 'package:digivizit/shared/components/text_field/custom_text_field.dart';

import '/features/auth/index.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin {
  final model = LoginViewModel();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDesign(
      pinnedHeader: false,
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Observer(
              builder: (_) {
                return ReactiveForm(
                  formGroup: model.form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            // Logo Container
                            FigmaContainer(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [AppColors.baseWhite.withValues(alpha: 0.25), AppColors.baseWhite.withValues(alpha: 0.10)],
                                ),
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.3), width: 2),
                                boxShadow: [BoxShadow(color: AppColors.baseBlack.withValues(alpha: 0.1), blurRadius: 20, offset: const Offset(0, 10))],
                              ),
                              child: Icon(Icons.account_circle_outlined, size: 50, color: AppColors.baseWhite),
                            ),
                            FigmaBox(height: 16),
                            // Başlık
                            Text("Hoş Geldiniz", style: AppFonts.baseBold.copyWith(fontSize: 36, color: AppColors.baseWhite, height: 1.2, letterSpacing: -0.5)),
                            FigmaBox(height: 16),
                            // Alt Başlık
                            Text(
                              "Hesabınıza giriş yapın",
                              style: AppFonts.baseRegular.copyWith(fontSize: 16, color: AppColors.baseWhite.withValues(alpha: 0.85)),
                            ),
                          ],
                        ),
                      ),

                      FigmaBox(height: 30),
                      CustomTextField.phoneNumber(formControlName: 'phone'),
                      FigmaBox(height: 24),
                      CustomTextField.password(formControlName: 'password'),
                      FigmaBox(height: 24),
                      // Beni Hatırla ve Şifremi Unuttum
                      buildRememberMeandForgetPassword(),
                      FigmaBox(height: 40),
                      // Giriş Butonu
                      CustomAppButton(
                        onTap: () => NavigationEnums.mainNavigation.navigateToPageClear(),
                        text: "Giriş Yap",
                        backgroundColor: AppColors.baseWhite,
                        textColor: AppColors.primary600,
                      ),
                      FigmaBox(height: 32),

                      // Divider veya Alternatif Giriş
                      Row(
                        children: [
                          Expanded(child: Divider(color: AppColors.baseWhite.withValues(alpha: 0.3), thickness: 1)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text("veya", style: AppFonts.baseRegular.copyWith(fontSize: 14, color: AppColors.baseWhite.withValues(alpha: 0.7))),
                          ),
                          Expanded(child: Divider(color: AppColors.baseWhite.withValues(alpha: 0.3), thickness: 1)),
                        ],
                      ),
                      FigmaBox(height: 32),

                      // Kayıt Ol Bölümü
                      Center(
                        child: FigmaContainer(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                            color: AppColors.baseWhite.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.2), width: 1),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Hesabınız yok mu? ",
                                style: AppFonts.baseRegular.copyWith(fontSize: 15, color: AppColors.baseWhite.withValues(alpha: 0.85)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Kayıt sayfasına yönlendir
                                },
                                child: Text(
                                  "Kayıt Ol",
                                  style: AppFonts.baseBold.copyWith(
                                    fontSize: 15,
                                    color: AppColors.baseWhite,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.baseWhite,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FigmaBox(height: 40),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRememberMeandForgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: model.toggleRememberMe,
          behavior: HitTestBehavior.translucent,
          child: Observer(
            builder: (_) {
              return Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedHexagonCheckbox(
                    onChanged: model.toggleRememberMe,
                    cornerRadius: 2,
                    isChecked: model.rememberMe,
                    checkedColor: AppColors.baseWhite,
                    checkColor: AppColors.primary500,
                    borderColor: AppColors.baseWhite,
                    size: 26,
                  ),
                  Text("Beni Hatırla", style: AppFonts.baseRegular),
                ],
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text("Şifremi Unuttum?", style: AppFonts.baseBold.withColor(AppColors.baseWhite)),
        ),
      ],
    );
  }

  void showBottomSheet() {
    CustomBottomSheet.customView(
      viewTopBar: true,
      backgroundColor: AppColors.primary500.withValues(alpha: 0.15),
      title: 'Kayıt Başarılı',
      hexagonIcon: Icons.done_rounded,
      hexagonColor: AppColors.tertiary500,
      text: "Kayıt başarılı bir şekilde gerçekleştirildi. Sistemden onay geldikten sonra giriş yapabilirsiniz.",
      height: 519,
      borderRadius: 50,
      context: AppSettings.instance.context!,
      buttons: [
        ButtonProperties(
          onPressed: () {
            Navigator.pop(AppSettings.instance.context!);
          },
          text: "Tamam",
          color: AppColors.tertiary500,
        ),
      ],
    );
  }
}

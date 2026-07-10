import 'dart:ui';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/image_paths.dart';
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

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  final model = LoginViewModel();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    model.loadSavedCredentials();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

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
      topColor: const Color(0xFFF8F9FB),
      bottomColor: const Color(0xFFFFFFFF),
      backgroundWidget: _buildBackground(),
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeroSection(),
                    FigmaBox(height: 28),
                    Observer(
                      builder: (_) {
                        return ReactiveForm(
                          formGroup: model.form,
                          child: _buildLoginCard(),
                        );
                      },
                    ),
                    FigmaBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFFFFFF), Color(0xFFF8F9FB), Color(0xFFEFF3F9)],
            ),
          ),
        ),
        Positioned(
          top: -120,
          right: -60,
          child: _buildGlow(
            size: 280,
            color: AppColors.primary300.withValues(alpha: 0.30),
          ),
        ),
        Positioned(
          top: 140,
          left: -90,
          child: _buildGlow(
            size: 220,
            color: AppColors.tertiary300.withValues(alpha: 0.22),
          ),
        ),
        Positioned(
          bottom: -120,
          right: 20,
          child: _buildGlow(
            size: 260,
            color: AppColors.info300.withValues(alpha: 0.24),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.baseWhite.withValues(alpha: 0.4),
                  Colors.transparent,
                  AppColors.baseWhite.withValues(alpha: 0.4),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGlow({required double size, required Color color}) {
    return IgnorePointer(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 64, sigmaY: 64),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      children: [
        FigmaContainer(
          width: 180,
          height: 76,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.baseWhite,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.hairline, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.ink.withValues(alpha: 0.07),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Image.asset(ImagePaths.logo, height: 100, fit: BoxFit.cover),
        ),
        FigmaBox(height: 18),
        Text(
          'Hos Geldiniz',
          textAlign: TextAlign.center,
          style: AppFonts.xl3Bold.copyWith(
            color: AppColors.ink,
            height: 1.1,
            letterSpacing: -0.6,
          ),
        ),
        FigmaBox(height: 8),
        Text(
          'Devam etmek icin giris yapin',
          textAlign: TextAlign.center,
          style: AppFonts.lgRegular.withColor(AppColors.inkSoft),
        ),
      ],
    );
  }

  Widget _buildLoginCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.baseWhite,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColors.hairline, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.ink.withValues(alpha: 0.08),
                blurRadius: 32,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardHeader(),
              FigmaBox(height: 20),
              FigmaContainer(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.hairline),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField.regular(
                      formControlName: 'email',
                      label: 'Email',
                      hintText: 'ornek@exponot.com',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.alternate_email_rounded,
                      labelColor: AppColors.ink,
                    ),
                    FigmaBox(height: 18),
                    CustomTextField.password(
                      formControlName: 'password',
                      labelColor: AppColors.ink,
                    ),
                    FigmaBox(height: 18),
                    _buildRememberMeAndForgetPassword(),
                    FigmaBox(height: 24),
                    CustomAppButton.text(
                      onTap: () => model.login(),
                      text: 'Giris Yap',
                      leadingIcon: Icons.login_rounded,
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF60A5FA), Color(0xFF2563EB)],
                      ),
                      textColor: AppColors.baseWhite,
                      iconColor: AppColors.baseWhite,
                      buttonHeight: 62,
                      borderRadius: 20,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary400.withValues(alpha: 0.16),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.lock_person_rounded,
            color: AppColors.primary300,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Giris',
                style: AppFonts.xlBold.copyWith(
                  color: AppColors.ink,
                  height: 1.1,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Email ve sifre ile devam edin',
                style: AppFonts.baseRegular.withColor(AppColors.inkSoft),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeAndForgetPassword() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: model.toggleRememberMe,
            behavior: HitTestBehavior.translucent,
            child: Observer(
              builder: (_) {
                return Row(
                  children: [
                    AnimatedHexagonCheckbox(
                      onChanged: model.toggleRememberMe,
                      cornerRadius: 2,
                      isChecked: model.rememberMe,
                      checkedColor: AppColors.primary500,
                      checkColor: AppColors.baseWhite,
                      borderColor: AppColors.inkFaint,
                      size: 26,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Beni Hatirla',
                        style: AppFonts.baseRegular.withColor(AppColors.ink),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: _showForgotPasswordSheet,
          child: Text(
            'Sifremi Unuttum?',
            style: AppFonts.baseBold.withColor(AppColors.primary600),
          ),
        ),
      ],
    );
  }

  Widget _buildSheetField(
    String label,
    TextEditingController controller, {
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: AppFonts.baseRegular.copyWith(color: AppColors.ink),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppFonts.baseRegular.copyWith(color: AppColors.inkSoft),
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.hairline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.hairline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary500, width: 1.5),
        ),
      ),
    );
  }

  void _showForgotPasswordSheet() {
    final emailController = TextEditingController();
    bool isSubmitting = false;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.baseWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (sheetContext, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sifremi Unuttum',
                    style: AppFonts.xlBold.copyWith(color: AppColors.ink),
                  ),
                  FigmaBox(height: 8),
                  Text(
                    'Kayitli e-posta adresinizi girin, sifre sifirlama baglantisi gonderelim.',
                    style: AppFonts.baseRegular.withColor(AppColors.inkSoft),
                  ),
                  FigmaBox(height: 16),
                  _buildSheetField(
                    'Email',
                    emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  FigmaBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: CustomAppButton.text(
                      onTap: isSubmitting
                          ? null
                          : () async {
                              final email = emailController.text.trim();
                              if (email.isEmpty) return;

                              setSheetState(() => isSubmitting = true);
                              final result = await AppSettings
                                  .instance
                                  .generalService
                                  .forgotPassword(email: email);
                              setSheetState(() => isSubmitting = false);

                              if (!sheetContext.mounted) return;
                              Navigator.of(sheetContext).pop();

                              if (result.isSuccess) {
                                _showResetPasswordSheet(prefilledEmail: email);
                              } else {
                                CustomBottomSheet.errorView(
                                  text:
                                      result.error?.message ??
                                      'Sifre sifirlama linki gonderilemedi.',
                                );
                              }
                            },
                      text: isSubmitting ? 'Gonderiliyor...' : 'Gonder',
                      gradient: const LinearGradient(
                        colors: [Color(0xFF60A5FA), Color(0xFF2563EB)],
                      ),
                      textColor: AppColors.baseWhite,
                      buttonHeight: 56,
                      borderRadius: 18,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showResetPasswordSheet({String? prefilledEmail}) {
    final emailController = TextEditingController(text: prefilledEmail ?? '');
    final tokenController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();
    bool isSubmitting = false;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.baseWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (sheetContext, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sifre Sifirla',
                      style: AppFonts.xlBold.copyWith(color: AppColors.ink),
                    ),
                    FigmaBox(height: 8),
                    Text(
                      'E-postaniza gelen kodu ve yeni sifrenizi girin.',
                      style: AppFonts.baseRegular.withColor(AppColors.inkSoft),
                    ),
                    FigmaBox(height: 16),
                    _buildSheetField(
                      'Email',
                      emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    FigmaBox(height: 14),
                    _buildSheetField('Kod', tokenController),
                    FigmaBox(height: 14),
                    _buildSheetField(
                      'Yeni Sifre',
                      passwordController,
                      obscureText: true,
                    ),
                    FigmaBox(height: 14),
                    _buildSheetField(
                      'Yeni Sifre (Tekrar)',
                      confirmController,
                      obscureText: true,
                    ),
                    FigmaBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: CustomAppButton.text(
                        onTap: isSubmitting
                            ? null
                            : () async {
                                final email = emailController.text.trim();
                                final token = tokenController.text.trim();
                                final password = passwordController.text;
                                final confirm = confirmController.text;

                                if (email.isEmpty ||
                                    token.isEmpty ||
                                    password.isEmpty ||
                                    password != confirm) {
                                  CustomBottomSheet.errorView(
                                    text:
                                        'Lutfen tum alanlari eksiksiz ve sifreleri ayni girin.',
                                  );
                                  return;
                                }

                                setSheetState(() => isSubmitting = true);
                                final result = await AppSettings
                                    .instance
                                    .generalService
                                    .resetPassword(
                                      token: token,
                                      email: email,
                                      password: password,
                                      passwordConfirmation: confirm,
                                    );
                                setSheetState(() => isSubmitting = false);

                                if (!sheetContext.mounted) return;
                                Navigator.of(sheetContext).pop();

                                if (!mounted) return;
                                if (result.isSuccess) {
                                  CustomBottomSheet.customView(
                                    context: context,
                                    viewTopBar: true,
                                    title: 'Sifre Guncellendi',
                                    hexagonIcon: Icons.done_rounded,
                                    hexagonColor: AppColors.tertiary500,
                                    text:
                                        'Sifreniz basariyla guncellendi. Yeni sifrenizle giris yapabilirsiniz.',
                                    buttons: [
                                      ButtonProperties(
                                        onPressed: () => Navigator.pop(context),
                                        text: 'Tamam',
                                        color: AppColors.tertiary500,
                                      ),
                                    ],
                                  );
                                } else {
                                  CustomBottomSheet.errorView(
                                    text:
                                        result.error?.message ??
                                        'Sifre guncellenemedi.',
                                  );
                                }
                              },
                        text: isSubmitting
                            ? 'Gonderiliyor...'
                            : 'Sifreyi Guncelle',
                        gradient: const LinearGradient(
                          colors: [Color(0xFF60A5FA), Color(0xFF2563EB)],
                        ),
                        textColor: AppColors.baseWhite,
                        buttonHeight: 56,
                        borderRadius: 18,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showBottomSheet() {
    final sheetContext = AppSettings.instance.context;
    if (sheetContext == null) {
      return;
    }

    CustomBottomSheet.customView(
      viewTopBar: true,
      title: 'Kayıt Başarılı',
      hexagonIcon: Icons.done_rounded,
      hexagonColor: AppColors.tertiary500,
      text:
          'Kayıt başarılı bir şekilde gerçekleştirildi. Sistemden onay geldikten sonra giriş yapabilirsiniz.',
      height: 519,
      borderRadius: 50,
      context: sheetContext,
      buttons: [
        ButtonProperties(
          onPressed: () {
            Navigator.pop(sheetContext);
          },
          text: 'Tamam',
          color: AppColors.tertiary500,
        ),
      ],
    );
  }
}

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
      topColor: const Color(0xFF0A1835),
      bottomColor: const Color(0xFF07111F),
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
              colors: [Color(0xFF11254A), Color(0xFF0C1830), Color(0xFF060C18)],
            ),
          ),
        ),
        Positioned(
          top: -120,
          right: -60,
          child: _buildGlow(
            size: 280,
            color: AppColors.primary400.withValues(alpha: 0.24),
          ),
        ),
        Positioned(
          top: 140,
          left: -90,
          child: _buildGlow(
            size: 220,
            color: AppColors.tertiary400.withValues(alpha: 0.16),
          ),
        ),
        Positioned(
          bottom: -120,
          right: 20,
          child: _buildGlow(
            size: 260,
            color: AppColors.primary700.withValues(alpha: 0.22),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.baseWhite.withValues(alpha: 0.04),
                  Colors.transparent,
                  AppColors.baseBlack.withValues(alpha: 0.24),
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
            color: AppColors.baseWhite.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.baseWhite.withValues(alpha: 0.18),
              width: 1.15,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.baseBlack.withValues(alpha: 0.12),
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
            color: AppColors.baseWhite,
            height: 1.1,
            letterSpacing: -0.6,
          ),
        ),
        FigmaBox(height: 8),
        Text(
          'Devam etmek icin giris yapin',
          textAlign: TextAlign.center,
          style: AppFonts.lgRegular.withColor(
            AppColors.baseWhite.withValues(alpha: 0.74),
          ),
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
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.baseWhite.withValues(alpha: 0.14),
                AppColors.baseWhite.withValues(alpha: 0.06),
              ],
            ),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: AppColors.baseWhite.withValues(alpha: 0.16),
              width: 1.15,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.baseBlack.withValues(alpha: 0.14),
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
                  color: AppColors.secondary900.withValues(alpha: 0.30),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColors.baseWhite.withValues(alpha: 0.08),
                  ),
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
                    ),
                    FigmaBox(height: 18),
                    CustomTextField.password(
                      formControlName: 'password',
                      labelColor: AppColors.baseWhite,
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
                  color: AppColors.baseWhite,
                  height: 1.1,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Email ve sifre ile devam edin',
                style: AppFonts.baseRegular.withColor(
                  AppColors.baseWhite.withValues(alpha: 0.64),
                ),
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
                      checkedColor: AppColors.baseWhite,
                      checkColor: AppColors.primary500,
                      borderColor: AppColors.baseWhite,
                      size: 26,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Beni Hatirla',
                        style: AppFonts.baseRegular.withColor(
                          AppColors.baseWhite.withValues(alpha: 0.84),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sifremi Unuttum?',
            style: AppFonts.baseBold.withColor(AppColors.primary200),
          ),
        ),
      ],
    );
  }

  void showBottomSheet() {
    final sheetContext = AppSettings.instance.context;
    if (sheetContext == null) {
      return;
    }

    CustomBottomSheet.customView(
      viewTopBar: true,
      backgroundColor: AppColors.primary500.withValues(alpha: 0.15),
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

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum CustomTextFieldType {
  phoneNumber,
  password,
  request,
  regular,
  plate,
  simpleInput,
}

/// Reusable auth text field for login/register screens
/// Supports both regular input and password input with visibility toggle
class CustomTextField extends StatefulWidget {
  final String formControlName;
  final String? label;
  final String? hintText;
  final IconData? prefixIcon;
  final CustomTextFieldType type;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Map<String, String Function(Object)>? validationMessages;
  final Color? labelColor;
  final bool labelVisible;
  final TextEditingController? controller;
  final bool readOnly;

  const CustomTextField._({
    super.key,
    required this.formControlName,
    this.label,
    this.hintText,
    this.prefixIcon,
    required this.type,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.labelColor,
    this.validationMessages,
    this.labelVisible = true,
    this.controller,
    this.readOnly = false,
  });

  /// Factory constructor for regular text field
  factory CustomTextField.regular({
    Key? key,
    required String formControlName,
    String? label,
    String? hintText,
    IconData? prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
    Map<String, String Function(Object)>? validationMessages,
    Color? labelColor,
    bool labelVisible = true,
  }) {
    return CustomTextField._(
      key: key,
      formControlName: formControlName,
      label: label,
      hintText: hintText,
      prefixIcon: prefixIcon,
      type: CustomTextFieldType.regular,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: inputFormatters,
      validationMessages: validationMessages,
      labelColor: labelColor,
      labelVisible: labelVisible,
    );
  }

  /// Factory constructor for phone number field
  factory CustomTextField.phoneNumber({
    Key? key,
    required String formControlName,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    Color? labelColor,
    Map<String, String Function(Object)>? validationMessages,
    bool readOnly = false,
  }) {
    return CustomTextField._(
      key: key,
      formControlName: formControlName,
      label: 'Email Adresiniz',
      hintText: 'example@exponot.com',
      prefixIcon: Icons.phone_outlined,
      type: CustomTextFieldType.phoneNumber,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      validator: validator,
      labelColor: labelColor,
      validationMessages: validationMessages,
      readOnly: readOnly,
    );
  }

  /// Factory constructor for password field
  factory CustomTextField.password({
    Key? key,
    required String formControlName,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    Color? labelColor,
    Map<String, String Function(Object)>? validationMessages,
    bool labelVisible = true,
  }) {
    return CustomTextField._(
      key: key,
      formControlName: formControlName,
      label: 'Şifre',
      hintText: 'Şifrenizi giriniz',
      prefixIcon: Icons.lock_outline,
      type: CustomTextFieldType.password,

      onChanged: onChanged,
      validator: validator,
      labelColor: labelColor,
      validationMessages: validationMessages,
      labelVisible: labelVisible,
    );
  }

  /// Factory constructor for request field
  factory CustomTextField.request({
    Key? key,
    required String formControlName,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    Color? labelColor,
    Map<String, String Function(Object)>? validationMessages,
    bool labelVisible = false,
  }) {
    return CustomTextField._(
      key: key,
      formControlName: formControlName,
      label: 'Talep',
      hintText: 'Servis talebinizi detaylı olarak açıklayın...',
      type: CustomTextFieldType.request,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      validator: validator,
      labelColor: labelColor,
      validationMessages: validationMessages,
      labelVisible: labelVisible,
    );
  }

  factory CustomTextField.plate({
    Key? key,
    required String formControlName,
    String? label,
    String? hintText,
    IconData? prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
    Map<String, String Function(Object)>? validationMessages,
    Color? labelColor,
    bool labelVisible = true,
  }) {
    return CustomTextField._(
      key: key,
      formControlName: formControlName,
      label: label,
      hintText: hintText,
      prefixIcon: prefixIcon,
      type: CustomTextFieldType.plate,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: inputFormatters,
      validationMessages: validationMessages,
      labelColor: labelColor,
      labelVisible: labelVisible,
    );
  }

  /// Factory constructor for simple input field (without ReactiveForm)
  factory CustomTextField.simpleInput({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? hintText,
    IconData? prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
    Color? labelColor,
    bool labelVisible = true,
  }) {
    return CustomTextField._(
      key: key,
      formControlName: '',
      controller: controller,
      label: label,
      hintText: hintText,
      prefixIcon: prefixIcon,
      type: CustomTextFieldType.simpleInput,
      keyboardType: keyboardType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      labelColor: labelColor,
      labelVisible: labelVisible,
    );
  }

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return switch (widget.type) {
      CustomTextFieldType.phoneNumber => _buildPhoneNumberField(),
      CustomTextFieldType.password => _buildPasswordField(),
      CustomTextFieldType.request => _buildRequestField(),
      CustomTextFieldType.regular => _buildRegularField(),
      CustomTextFieldType.plate => _buildPlateField(),
      CustomTextFieldType.simpleInput => _buildSimpleInputField(),
    };
  }

  // ------------------ Field Builders ------------------ //

  Widget _buildPhoneNumberField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelVisible) _buildLabel(),
        const SizedBox(height: 8),
        Opacity(
          opacity: widget.readOnly ? 0.6 : 1.0,
          child: ReactiveTextField(
            formControlName: widget.formControlName,
            validationMessages: widget.validationMessages,
            showErrors: (control) => false,
            keyboardType: widget.keyboardType,
            readOnly: widget.readOnly,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
              _PhoneNumberFormatter(),
            ],
            style: AppFonts.baseRegular.copyWith(color: AppColors.baseBlack),
            decoration: _buildInputDecoration(
              suffixIcon: widget.readOnly
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.lock_outline,
                        size: 18,
                        color: AppColors.neutral500,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelVisible) _buildLabel(),
        const SizedBox(height: 8),
        ReactiveTextField(
          formControlName: widget.formControlName,
          validationMessages: widget.validationMessages,
          showErrors: (control) => false,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          style: AppFonts.baseRegular.copyWith(color: AppColors.baseBlack),
          decoration: _buildInputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 20,
                color: AppColors.neutral500,
              ),
              onPressed: () => setState(() => _obscureText = !_obscureText),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRequestField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(),
        const SizedBox(height: 8),
        ReactiveTextField(
          maxLength: 250,
          maxLines: 10,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          formControlName: widget.formControlName,
          validationMessages: widget.validationMessages,
          keyboardType: widget.keyboardType,
          style: AppFonts.baseRegular.copyWith(color: AppColors.baseBlack),
          decoration: _buildInputDecoration(),
        ),
      ],
    );
  }

  Widget _buildRegularField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelVisible) _buildLabel(),
        const SizedBox(height: 8),
        ReactiveTextField(
          formControlName: widget.formControlName,
          validationMessages: widget.validationMessages,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          style: AppFonts.baseRegular.copyWith(color: AppColors.baseBlack),
          decoration: _buildInputDecoration(),
        ),
      ],
    );
  }

  Widget _buildPlateField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelVisible) _buildLabel(),
        const SizedBox(height: 8),
        ReactiveTextField(
          formControlName: widget.formControlName,
          validationMessages: widget.validationMessages,
          keyboardType: widget.keyboardType,
          textCapitalization: TextCapitalization.characters,
          inputFormatters: [
            LengthLimitingTextInputFormatter(12) /* TurkishPlateFormatter() */,
          ],
          style: AppFonts.baseRegular.copyWith(color: AppColors.baseBlack),
          decoration: _buildInputDecoration(),
        ),
      ],
    );
  }

  Widget _buildSimpleInputField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelVisible && widget.label != null) _buildLabel(),
        if (widget.labelVisible && widget.label != null)
          const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          style: AppFonts.baseRegular.copyWith(color: AppColors.baseBlack),
          decoration: _buildInputDecoration(),
        ),
      ],
    );
  }

  // ------------------ Common Widgets ------------------ //

  Widget _buildLabel() {
    return Text(
      widget.label ?? '',
      style: AppFonts.baseSemibold
          .copyWith(letterSpacing: 0.20)
          .withColor(widget.labelColor ?? AppColors.baseWhite),
    );
  }

  InputDecoration _buildInputDecoration({Widget? suffixIcon}) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.baseWhite,
      hintText: widget.hintText,
      hintStyle: AppFonts.baseRegular.copyWith(
        color: const Color(0xFFD1D5DB),
        fontSize: 15,
      ),
      prefixIcon: _buildPrefixIcon(),
      prefixIconConstraints: const BoxConstraints(minWidth: 42, minHeight: 42),
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: _buildOutlineInputBorder(const Color(0xFFE5E7EB)),
      enabledBorder: _buildOutlineInputBorder(const Color(0xFFE5E7EB)),
      focusedBorder: _buildOutlineInputBorder(AppColors.primary500, width: 1.5),
      errorBorder: _buildOutlineInputBorder(AppColors.negative500),
      focusedErrorBorder: _buildOutlineInputBorder(
        AppColors.negative500,
        width: 1.5,
      ),
    );
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixIcon == null) return null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Icon(widget.prefixIcon, size: 18, color: AppColors.neutral500),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(
    Color color, {
    double width = 1.15,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: width, color: color),
    );
  }
}

/// Custom formatter to display phone number as: 5XX XXX XX XX
class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 3 || i == 6 || i == 8) {
        buffer.write(' ');
      }
      buffer.write(text[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

/* class TurkishPlateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return HomeViewModelBase.plateFormatterLogic(oldValue, newValue);
  }
} */

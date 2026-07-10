import 'dart:io';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/business_cards/business_card_scan_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
import 'package:digivizit/shared/components/alert/custom_snacbar.dart';
import 'package:digivizit/shared/components/alert/custom_dialog.dart';
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class QrView extends StatefulWidget {
  final Future<void> Function()? onContactsChanged;

  const QrView({super.key, this.onContactsChanged});

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> with SingleTickerProviderStateMixin {
  final HomeViewModel _homeViewModel = HomeViewModel();
  final ImagePicker _imagePicker = ImagePicker();
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  final _companyController = TextEditingController();
  final _nameSurnameController = TextEditingController();
  final _unvanController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();
  final _sectorController = TextEditingController();
  final _addressController = TextEditingController();
  final _noteController = TextEditingController();

  File? _selectedImage;
  BusinessCardScanResponse? _scanResponse;
  final String _selectedEngine = 'gemini';
  bool _isPickingImage = false;
  bool _isUploading = false;
  bool _isSaving = false;
  final Color _topColor = const Color(0xFFF8F9FB);
  final Color _bottomColor = const Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    final savedProfile = AppSettings.instance.profile;
    if (savedProfile != null) {
      _homeViewModel.setInitialProfile(savedProfile);
    }

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _companyController.dispose();
    _nameSurnameController.dispose();
    _unvanController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    _sectorController.dispose();
    _addressController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDesign(
      topColor: _topColor,
      bottomColor: _bottomColor,
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FigmaBox(height: 75),
                Text(
                  'Kartvizit Tara',
                  style: AppFonts.xl3Bold.copyWith(
                    color: AppColors.ink,
                    letterSpacing: -0.5,
                  ),
                ),
                FigmaBox(height: 10),
                Text(
                  'Kartvizitin fotoğrafını çekin veya galeriden yükleyin. Tarama sonrasında bilgileri düzenleyip bağlantılarım listesine kaydedebilirsiniz.',
                  style: AppFonts.baseRegular.copyWith(
                    color: AppColors.inkSoft,
                  ),
                ),
                FigmaBox(height: 24),
                _buildActionCard(),
                FigmaBox(height: 20),
                _buildImagePreviewCard(),
                FigmaBox(height: 20),
                if (_scanResponse != null) _buildResultForm(),
                FigmaBox(height: 120),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.add_photo_alternate_rounded,
                  color: AppColors.primary600,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kartviziti Ekleyin',
                      style: AppFonts.lgBold.withColor(AppColors.ink),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Kamera veya galeriyi kullanın',
                      style: AppFonts.smRegular.withColor(AppColors.inkSoft),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '1. ADIM',
                  style: AppFonts.xsBold.copyWith(
                    color: AppColors.primary600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          FigmaBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  icon: Icons.photo_camera_outlined,
                  label: 'Fotoğraf Çek',
                  description: 'Kamerayı aç',
                  onTap: () => _pickImage(ImageSource.camera),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton(
                  icon: Icons.photo_library_outlined,
                  label: 'Galeriden Seç',
                  description: 'Cihazdan yükle',
                  onTap: () => _pickImage(ImageSource.gallery),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required String description,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: _isPickingImage || _isUploading ? null : onTap,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surfaceAlt.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.hairline),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.baseWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary500.withValues(alpha: 0.10),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon, color: AppColors.primary600, size: 21),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.smSemibold.withColor(AppColors.ink),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.xsRegular.withColor(AppColors.inkSoft),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreviewCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Görsel Önizleme',
                      style: AppFonts.lgBold.withColor(AppColors.ink),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Kartvizitin tamamının göründüğünden emin olun',
                      style: AppFonts.smRegular.withColor(AppColors.inkSoft),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _selectedImage == null
                      ? AppColors.surfaceAlt
                      : AppColors.positive50,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _selectedImage == null
                          ? Icons.hourglass_empty_rounded
                          : Icons.check_circle_rounded,
                      size: 14,
                      color: _selectedImage == null
                          ? AppColors.inkFaint
                          : AppColors.positive600,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      _selectedImage == null ? 'Bekleniyor' : 'Hazır',
                      style: AppFonts.xsSemibold.withColor(
                        _selectedImage == null
                            ? AppColors.inkSoft
                            : AppColors.positive700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          FigmaBox(height: 16),
          if (_selectedImage == null)
            Container(
              width: double.infinity,
              height: 156,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF8FAFC), Color(0xFFEFF6FF)],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primary100),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: AppColors.baseWhite,
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary500.withValues(alpha: 0.12),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.credit_card_rounded,
                      size: 28,
                      color: AppColors.primary500,
                    ),
                  ),
                  FigmaBox(height: 10),
                  Text(
                    'Henüz görsel seçilmedi',
                    style: AppFonts.baseSemibold.withColor(AppColors.inkSoft),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Yukarıdaki seçeneklerden birini kullanın',
                    style: AppFonts.xsRegular.withColor(AppColors.inkFaint),
                  ),
                ],
              ),
            )
          else
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceAlt,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primary100),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: Image.file(_selectedImage!, fit: BoxFit.contain),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Material(
                    color: AppColors.baseWhite,
                    borderRadius: BorderRadius.circular(12),
                    elevation: 3,
                    child: InkWell(
                      onTap: _isUploading ? null : _removeSelectedImage,
                      borderRadius: BorderRadius.circular(12),
                      child: const SizedBox(
                        width: 38,
                        height: 38,
                        child: Icon(
                          Icons.close_rounded,
                          size: 20,
                          color: AppColors.inkSoft,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          FigmaBox(height: 16),
          _buildScanButton(),
        ],
      ),
    );
  }

  Widget _buildScanButton() {
    final hasSelectedImage = _selectedImage != null;
    final isEnabled = hasSelectedImage && !_isUploading && !_isPickingImage;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: hasSelectedImage
              ? const LinearGradient(
                  colors: [AppColors.primary600, AppColors.primary400],
                )
              : null,
          color: hasSelectedImage ? null : AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(18),
          boxShadow: hasSelectedImage
              ? [
                  BoxShadow(
                    color: AppColors.primary500.withValues(alpha: 0.24),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: InkWell(
          onTap: isEnabled ? _sendOcrRequest : null,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isUploading)
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.baseWhite,
                    ),
                  )
                else
                  Icon(
                    _selectedImage == null
                        ? Icons.document_scanner_outlined
                        : Icons.auto_awesome_rounded,
                    color: hasSelectedImage
                        ? AppColors.baseWhite
                        : AppColors.inkFaint,
                    size: 20,
                  ),
                const SizedBox(width: 9),
                Text(
                  _isUploading
                      ? 'Kartvizit Taranıyor...'
                      : _selectedImage == null
                      ? 'Önce bir görsel seçin'
                      : 'Kartviziti Tara',
                  style: AppFonts.base2Bold.copyWith(
                    color: hasSelectedImage
                        ? AppColors.baseWhite
                        : AppColors.inkFaint,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _removeSelectedImage() {
    setState(() {
      _selectedImage = null;
      _scanResponse = null;
    });
  }

  Widget _buildResultForm() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF34D399),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Tarama Sonucu',
                style: AppFonts.lgBold.withColor(AppColors.ink),
              ),
            ],
          ),
          FigmaBox(height: 8),
          Text(
            'Bilgileri kontrol edip gerekirse düzenleyin, ardından kaydedin.',
            style: AppFonts.baseRegular.copyWith(color: AppColors.inkSoft),
          ),
          FigmaBox(height: 16),
          _buildFormField('Şirket', _companyController),
          FigmaBox(height: 12),
          _buildFormField('Ad Soyad (virgülle ayırın)', _nameSurnameController),
          FigmaBox(height: 12),
          _buildFormField('Ünvan (virgülle ayırın)', _unvanController),
          FigmaBox(height: 12),
          _buildFormField(
            'E-posta',
            _emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          FigmaBox(height: 12),
          _buildFormField(
            'Telefon',
            _phoneController,
            keyboardType: TextInputType.phone,
          ),
          FigmaBox(height: 12),
          _buildFormField('Website', _websiteController),
          FigmaBox(height: 12),
          _buildFormField('Sektör', _sectorController),
          FigmaBox(height: 12),
          _buildFormField('Adres', _addressController, maxLines: 2),
          FigmaBox(height: 12),
          _buildFormField('Not', _noteController, maxLines: 2),
          FigmaBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _isSaving ? null : _saveBusinessCard,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              icon: _isSaving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.baseWhite,
                      ),
                    )
                  : const Icon(Icons.save_outlined, color: AppColors.baseWhite),
              label: Text(
                _isSaving ? 'Kaydediliyor...' : 'Kartvizit Olarak Kaydet',
                style: AppFonts.base2Bold.copyWith(color: AppColors.baseWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(
    String label,
    TextEditingController controller, {
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: AppFonts.base2Regular.copyWith(color: AppColors.ink),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppFonts.smSemibold.copyWith(color: AppColors.inkSoft),
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

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: AppColors.baseWhite,
      borderRadius: BorderRadius.circular(28),
      border: Border.all(color: AppColors.hairline),
      boxShadow: [
        BoxShadow(
          color: AppColors.ink.withValues(alpha: 0.05),
          blurRadius: 24,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    if (_isPickingImage || _isUploading) return;

    final hasPermission = await _ensurePermission(source);
    if (!hasPermission) return;

    setState(() {
      _isPickingImage = true;
    });

    try {
      final pickedFile = await _imagePicker.pickImage(
        source: source,
        imageQuality: 92,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (pickedFile == null || !mounted) {
        return;
      }

      setState(() {
        _selectedImage = File(pickedFile.path);
        _scanResponse = null;
      });
    } catch (_) {
      showCustomSnackbarOverlay(
        message: 'Gorsel secilirken bir hata olustu.',
        status: SnackbarStatusEnum.error,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isPickingImage = false;
        });
      }
    }
  }

  Future<void> _sendOcrRequest() async {
    final imageFile = _selectedImage;
    if (imageFile == null) {
      showCustomSnackbarOverlay(
        message: 'Once bir kartvizit gorseli secin.',
        status: SnackbarStatusEnum.warning,
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });

    final result = await _homeViewModel.scanBusinessCard(
      imageFile: imageFile,
      engine: _selectedEngine,
    );

    if (!mounted) return;

    setState(() {
      _isUploading = false;
      if (result.isSuccess) {
        _scanResponse = result.data;
        _populateFormFromScan(result.data?.data?.data);
      }
    });

    if (result.isSuccess) {
      showCustomSnackbarOverlay(
        message: 'Tarama basariyla tamamlandi.',
        status: SnackbarStatusEnum.success,
      );
    }
  }

  void _populateFormFromScan(BusinessCardScanData? data) {
    _companyController.text = data?.companyName?.trim() ?? '';
    _nameSurnameController.text = (data?.nameSurname ?? const [])
        .where((value) => value.trim().isNotEmpty)
        .join(', ');
    _unvanController.text = (data?.unvan ?? const [])
        .where((value) => value.trim().isNotEmpty)
        .join(', ');
    final listedEmails = (data?.emailList ?? const <String>[])
        .where((value) => value.trim().isNotEmpty)
        .toList();
    final firstListedEmail = listedEmails.isEmpty ? null : listedEmails.first;
    _emailController.text =
        data?.email?.trim() ?? (firstListedEmail?.trim() ?? '');
    _phoneController.text =
        data?.phone?.trim() ??
        (data?.phoneList?.mobile?.trim() ??
            data?.phoneList?.landline?.trim() ??
            '');
    _websiteController.text = data?.website?.trim() ?? '';
    _sectorController.text = data?.sector?.trim() ?? '';
    _addressController.text = data?.address?.trim() ?? '';
    _noteController.text = data?.note?.trim() ?? '';
  }

  Future<void> _saveBusinessCard() async {
    final companyName = _companyController.text.trim();
    if (companyName.isEmpty) {
      showCustomSnackbarOverlay(
        message: 'Lutfen firma adini girin.',
        status: SnackbarStatusEnum.warning,
      );
      return;
    }

    setState(() => _isSaving = true);

    final names = _nameSurnameController.text
        .split(',')
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toList();
    final titles = _unvanController.text
        .split(',')
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toList();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final website = _websiteController.text.trim();
    final sector = _sectorController.text.trim();
    final address = _addressController.text.trim();
    final note = _noteController.text.trim();
    final scanImage = _scanResponse?.data?.image;
    final countryId = _scanResponse?.data?.data?.countryId;

    final body = <String, dynamic>{
      "company_name": companyName,
      "name_surname": names.isEmpty ? null : names,
      "unvan": titles.isEmpty ? null : titles,
      "email_list": email.isEmpty ? null : [email],
      "phone_list": phone.isEmpty ? null : [phone],
      "email": email.isEmpty ? null : email,
      "phone": phone.isEmpty ? null : phone,
      "website": website.isEmpty ? null : website,
      "sector": sector.isEmpty ? null : sector,
      "address": address.isEmpty ? null : address,
      "country_id": countryId,
      "notes": note.isEmpty ? null : [note],
      "card_image": scanImage == null ? null : [scanImage],
    };

    final result = await _homeViewModel.createBusinessCard(body);

    if (!mounted) return;
    setState(() => _isSaving = false);

    if (result.isSuccess) {
      showCustomSnackbarOverlay(
        message: 'Kartvizit basariyla kaydedildi.',
        status: SnackbarStatusEnum.success,
      );
      setState(() {
        _selectedImage = null;
        _scanResponse = null;
      });
      _companyController.clear();
      _nameSurnameController.clear();
      _unvanController.clear();
      _emailController.clear();
      _phoneController.clear();
      _websiteController.clear();
      _sectorController.clear();
      _addressController.clear();
      _noteController.clear();

      try {
        await widget.onContactsChanged?.call();
      } catch (_) {}
    } else {
      showCustomSnackbarOverlay(
        message: result.error?.message ?? 'Kartvizit kaydedilemedi.',
        status: SnackbarStatusEnum.error,
      );
    }
  }

  Future<bool> _ensurePermission(ImageSource source) async {
    if (source == ImageSource.gallery && Platform.isAndroid) {
      return true;
    }

    final permission = source == ImageSource.camera
        ? Permission.camera
        : Permission.photos;

    var status = await permission.status;
    if (status.isGranted || status.isLimited) {
      return true;
    }

    status = await permission.request();
    if (status.isGranted || status.isLimited) {
      return true;
    }

    if (!mounted) return false;

    final isPermanentlyDenied =
        status.isPermanentlyDenied || status.isRestricted;

    final openSettings = await showCustomDialog(
      context: context,
      title: 'İzin Gerekli',
      message: source == ImageSource.camera
          ? 'Kartvizit fotoğrafı çekebilmek için kamera izni gerekli.'
          : 'Galeriden görsel seçmek için fotoğraf arşivi izni gerekli.',
      status: CustomDialogStatus.warning,
      icon: Icons.lock_outline_rounded,
      confirmText: isPermanentlyDenied ? 'Ayarları Aç' : 'Kapat',
      cancelText: isPermanentlyDenied ? 'Vazgeç' : null,
    );

    if (isPermanentlyDenied && openSettings == true) {
      await openAppSettings();
    }

    return false;
  }
}

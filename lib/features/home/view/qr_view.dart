import 'dart:io';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/business_cards/business_card_scan_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
import 'package:digivizit/shared/components/alert/custom_snacbar.dart';
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
          Text(
            'Görsel Seçimi',
            style: AppFonts.lgBold.withColor(AppColors.ink),
          ),
          FigmaBox(height: 8),
          Text(
            'Kartvizit görselini seçmek için aşağıdaki seçeneklerden birini kullanabilirsiniz.',
            style: AppFonts.baseRegular.copyWith(color: AppColors.inkSoft),
          ),
          FigmaBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  icon: Icons.photo_camera_outlined,
                  label: 'Fotoğraf Çek',
                  onTap: () => _pickImage(ImageSource.camera),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton(
                  icon: Icons.photo_library_outlined,
                  label: 'Galeriden Seç',
                  onTap: () => _pickImage(ImageSource.gallery),
                ),
              ),
            ],
          ),
          FigmaBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _isUploading || _isPickingImage
                  ? null
                  : _sendOcrRequest,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary500,
                foregroundColor: AppColors.baseWhite,
                disabledBackgroundColor: AppColors.surfaceAlt,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              icon: _isUploading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.cloud_upload_outlined),
              label: Text(
                _isUploading ? 'Yükleniyor...' : 'Kartviziti Tara',
                style: AppFonts.base2Bold.copyWith(color: AppColors.baseWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: _isPickingImage || _isUploading ? null : onTap,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.hairline),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary600, size: 28),
            FigmaBox(height: 10),
            Text(
              label,
              style: AppFonts.baseSemibold.withColor(AppColors.ink),
              textAlign: TextAlign.center,
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
          Text(
            'Seçilen Görsel',
            style: AppFonts.lgBold.withColor(AppColors.ink),
          ),
          FigmaBox(height: 16),
          if (_selectedImage == null)
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.hairline),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.credit_card, size: 54, color: AppColors.inkFaint),
                  FigmaBox(height: 12),
                  Text(
                    'Henüz bir kartvizit seçilmedi.',
                    style: AppFonts.baseRegular.copyWith(
                      color: AppColors.inkSoft,
                    ),
                  ),
                ],
              ),
            )
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.file(_selectedImage!, fit: BoxFit.cover),
              ),
            ),
        ],
      ),
    );
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

    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.baseWhite,
          title: Text(
            'Izin Gerekli',
            style: AppFonts.lgBold.withColor(AppColors.ink),
          ),
          content: Text(
            source == ImageSource.camera
                ? 'Kartvizit fotografi cekebilmek icin kamera izni gerekli.'
                : 'Galeriden gorsel secmek icin fotograf arsivi izni gerekli.',
            style: AppFonts.baseRegular.copyWith(color: AppColors.inkSoft),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Kapat',
                style: AppFonts.baseSemibold.copyWith(color: AppColors.inkSoft),
              ),
            ),
            if (isPermanentlyDenied)
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await openAppSettings();
                },
                child: Text(
                  'Ayarlari Ac',
                  style: AppFonts.baseSemibold.copyWith(
                    color: AppColors.primary600,
                  ),
                ),
              ),
          ],
        );
      },
    );

    return false;
  }
}

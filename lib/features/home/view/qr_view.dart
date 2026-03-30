import 'dart:io';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/ocr/ocr_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
import 'package:digivizit/shared/components/alert/custom_snacbar.dart';
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class QrView extends StatefulWidget {
  const QrView({super.key});

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> with SingleTickerProviderStateMixin {
  final HomeViewModel _homeViewModel = HomeViewModel();
  final ImagePicker _imagePicker = ImagePicker();
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  File? _selectedImage;
  OcrResponse? _ocrResponse;
  String _selectedEngine = 'gemini';
  bool _isPickingImage = false;
  bool _isUploading = false;
  Color _topColor = const Color(0xFF0F3B57);
  Color _bottomColor = const Color(0xFF071C2D);

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

    final savedPersonelInfo = AppSettings.instance.personelInfo;
    if (savedPersonelInfo != null) {
      _homeViewModel.setInitialPersonelInfo(savedPersonelInfo);
    }
    _homeViewModel
        .loadBackgroundColors(
          topFallback: _topColor,
          bottomFallback: _bottomColor,
        )
        .then((gradientColors) {
          if (!mounted) return;
          setState(() {
            _topColor = gradientColors.topColor;
            _bottomColor = gradientColors.bottomColor;
          });
        });

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
                    color: AppColors.baseWhite,
                    letterSpacing: -0.5,
                  ),
                ),
                FigmaBox(height: 10),
                Text(
                  'Kartvizitin fotoğrafını çekin veya galeriden yükleyin. Seçtiğiniz görsel OCR servisine gönderilir ve bulunan bilgiler aşağıda listelenir.',
                  style: AppFonts.baseRegular.copyWith(
                    color: AppColors.baseWhite.withValues(alpha: 0.78),
                  ),
                ),
                FigmaBox(height: 24),
                _buildActionCard(),
                FigmaBox(height: 20),
                _buildImagePreviewCard(),
                FigmaBox(height: 20),
                if (_ocrResponse != null) _buildResultCard(_ocrResponse!),
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
          Text('Görsel Seçimi', style: AppFonts.lgBold),
          FigmaBox(height: 8),
          Text(
            'Varsayılan OCR motoru olarak gemini kullanılacaktır.',
            style: AppFonts.baseRegular.copyWith(
              color: AppColors.baseWhite.withValues(alpha: 0.7),
            ),
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
                backgroundColor: const Color(0xFF2DD4BF),
                foregroundColor: const Color(0xFF042F2E),
                disabledBackgroundColor: Colors.white24,
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
                _isUploading ? 'Yükleniyor...' : 'OCR İsteğini Gönder',
                style: AppFonts.base2Bold.copyWith(
                  color: const Color(0xFF042F2E),
                ),
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
          color: AppColors.baseWhite.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.baseWhite.withValues(alpha: 0.12),
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF7DD3FC), size: 28),
            FigmaBox(height: 10),
            Text(
              label,
              style: AppFonts.baseSemibold,
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
          Text('Seçilen Görsel', style: AppFonts.lgBold),
          FigmaBox(height: 16),
          if (_selectedImage == null)
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: AppColors.baseWhite.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.baseWhite.withValues(alpha: 0.1),
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.credit_card,
                    size: 54,
                    color: AppColors.baseWhite.withValues(alpha: 0.35),
                  ),
                  FigmaBox(height: 12),
                  Text(
                    'Henüz bir kartvizit seçilmedi.',
                    style: AppFonts.baseRegular.copyWith(
                      color: AppColors.baseWhite.withValues(alpha: 0.7),
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

  Widget _buildResultCard(OcrResponse response) {
    final data = response.data;
    final rows = <MapEntry<String, String>>[
      if ((data?.companyName ?? '').trim().isNotEmpty)
        MapEntry('Şirket', data!.companyName!.trim()),
      if ((data?.nameSurname ?? const <String>[])
          .where((value) => value.trim().isNotEmpty)
          .isNotEmpty)
        MapEntry(
          'Ad Soyad',
          data!.nameSurname!
              .where((value) => value.trim().isNotEmpty)
              .join(', '),
        ),
      if ((data?.unvan ?? const <dynamic>[])
          .whereType<String>()
          .where((value) => value.trim().isNotEmpty)
          .isNotEmpty)
        MapEntry(
          'Ünvan',
          data!.unvan!
              .whereType<String>()
              .where((value) => value.trim().isNotEmpty)
              .join(', '),
        ),
      if ((data?.emailList ?? const <String>[])
          .where((value) => value.trim().isNotEmpty)
          .isNotEmpty)
        MapEntry(
          'E-posta Listesi',
          data!.emailList!.where((value) => value.trim().isNotEmpty).join(', '),
        ),
      if ((data?.phoneList?.mobile ?? '').trim().isNotEmpty)
        MapEntry('Mobil', data!.phoneList!.mobile!.trim()),
      if ((data?.phoneList?.landline ?? '').trim().isNotEmpty)
        MapEntry('Sabit Hat', data!.phoneList!.landline!.trim()),
      if ((data?.phone ?? '').trim().isNotEmpty)
        MapEntry('Telefon', data!.phone!.trim()),
      if ((data?.email ?? '').trim().isNotEmpty)
        MapEntry('E-posta', data!.email!.trim()),
      if ((data?.website ?? '').trim().isNotEmpty)
        MapEntry('Website', data!.website!.trim()),
      if ((data?.sector ?? '').trim().isNotEmpty)
        MapEntry('Sektör', data!.sector!.trim()),
      if ((data?.address ?? '').trim().isNotEmpty)
        MapEntry('Adres', data!.address!.trim()),
      if ((data?.country ?? '').trim().isNotEmpty)
        MapEntry('Ülke', data!.country!.trim()),
      if ((data?.note ?? '').trim().isNotEmpty)
        MapEntry('Not', data!.note!.trim()),
    ];

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
              Text('OCR Sonucu', style: AppFonts.lgBold),
            ],
          ),
          FigmaBox(height: 8),
          Text(
            (response.message?.trim().isNotEmpty ?? false)
                ? response.message!.trim()
                : 'Servisten gelen alanlar aşağıda listelendi.',
            style: AppFonts.baseRegular.copyWith(
              color: AppColors.baseWhite.withValues(alpha: 0.72),
            ),
          ),
          FigmaBox(height: 16),
          if (rows.isEmpty)
            Text(
              'OCR tamamlandı ancak gösterilecek bir alan bulunamadı.',
              style: AppFonts.baseRegular.copyWith(
                color: AppColors.baseWhite.withValues(alpha: 0.72),
              ),
            )
          else
            ...rows.map(_buildResultRow),
        ],
      ),
    );
  }

  Widget _buildResultRow(MapEntry<String, String> entry) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.key,
            style: AppFonts.smSemibold.copyWith(
              color: const Color(0xFF93C5FD),
              letterSpacing: 0.2,
            ),
          ),
          FigmaBox(height: 4),
          Text(
            entry.value,
            style: AppFonts.base2Regular.copyWith(
              color: AppColors.baseWhite.withValues(alpha: 0.92),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: const Color(0xFF081520).withValues(alpha: 0.56),
      borderRadius: BorderRadius.circular(28),
      border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.1)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.16),
          blurRadius: 28,
          offset: const Offset(0, 14),
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
        _ocrResponse = null;
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

    final result = await _homeViewModel.getOcrData(
      imageFile: imageFile,
      engine: _selectedEngine,
    );

    if (!mounted) return;

    setState(() {
      _isUploading = false;
      if (result.isSuccess) {
        _ocrResponse = result.data;
      }
    });

    if (result.isSuccess) {
      showCustomSnackbarOverlay(
        message: 'OCR istegi basariyla tamamlandi.',
        status: SnackbarStatusEnum.success,
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
          backgroundColor: const Color(0xFF10273B),
          title: Text('Izin Gerekli', style: AppFonts.lgBold),
          content: Text(
            source == ImageSource.camera
                ? 'Kartvizit fotografi cekebilmek icin kamera izni gerekli.'
                : 'Galeriden gorsel secmek icin fotograf arsivi izni gerekli.',
            style: AppFonts.baseRegular.copyWith(
              color: AppColors.baseWhite.withValues(alpha: 0.82),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Kapat',
                style: AppFonts.baseSemibold.copyWith(
                  color: AppColors.baseWhite.withValues(alpha: 0.72),
                ),
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
                    color: const Color(0xFF7DD3FC),
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

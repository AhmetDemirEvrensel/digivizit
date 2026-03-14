# Görüşme Talepleri Özelliği

## 📋 Yapılan Değişiklikler

### 1. Model Katmanı (`lib/core/models/meeting/`)
- **meeting_request_model.dart**: Görüşme talebi için veri modeli oluşturuldu
  - Gönderen kişinin isim, soyisim, firma adı, ünvan bilgileri
  - Talep edilen görüşme tarihi ve saati
  - Not alanı
  - Durum (Beklemede, Onaylandı, Reddedildi, Revize Önerildi)

### 2. UI Katmanı (`lib/features/meeting_requests/view/`)
- **meeting_requests_view.dart**: Görüşme talepleri sayfası oluşturuldu

## ✨ Özellikler

### Üst Kısım - Takvim Görünümü
- Haftalık takvim görünümü
- Görüşme taleplerinin olduğu günler işaretli
- Bugünün tarihi öne çıkartılmış
- Ay ileri/geri navigasyonu

### Alt Kısım - Talep Listesi
Her görüşme talebi kartında:
- **Gönderen Bilgileri**:
  - İsim - Soyisim
  - Firma Adı
  - Ünvan
- **Görüşme Detayları**:
  - Talep edilen tarih ve saat
  - Not (varsa)
- **Durum Badge'i**: Talebin mevcut durumu (Beklemede, Onaylandı, vb.)

### Aksiyon Butonları (Sadece beklemedeki talepler için)
1. **✅ Onayla**: Görüşmeyi direkt onaylama
2. **📝 Revize**: Alternatif tarih ve saat önerme
3. **❌ Reddet**: Görüşmeyi reddetme (opsiyonel sebep notu ile)

## 🔗 Entegrasyon

### Home Ekranı
- `lib/features/home/view/home_view.dart` dosyasında "Görüşme Talebi" butonu artık yeni sayfaya yönlendiriyor

## 📱 Kullanım

1. Ana ekranda "Görüşme Talebi" butonuna tıklayın
2. Üstteki takvimde görüşme taleplerinin olduğu günleri görün
3. Alttaki listede tüm talepleri inceleyin
4. Her talep için uygun aksiyonu seçin:
   - Onayla → Görüşme onaylandı
   - Revize → Yeni bir tarih/saat önerin
   - Reddet → Talebi reddedin

## 🚀 Sonraki Adımlar (TODO)

### Backend Entegrasyonu
Şu fonksiyonlar API'ye bağlanmalı:
- `_loadMeetingRequests()`: Görüşme taleplerini API'den çekme
- `_approveMeeting()`: Görüşmeyi onaylama
- `_rejectMeeting()`: Görüşmeyi reddetme
- `_proposeDateRevision()`: Revize tarihi önerme

### Takvim Entegrasyonu
Onaylanan görüşmeler için:
- Google Calendar
- Apple Calendar
- Outlook Calendar
Entegrasyonları eklenebilir.

### Bildirim Sistemi
- Yeni talep geldiğinde bildirim
- Talep onaylandığında/reddedildiğinde bildirim
- Revize önerildiğinde bildirim

## 📝 Örnek API Request/Response

### Talepleri Çekme
```dart
GET /api/meeting-requests
Response:
{
  "success": true,
  "data": [
    {
      "id": "1",
      "senderName": "Ahmet",
      "senderSurname": "Yılmaz",
      "companyName": "ABC Teknoloji A.Ş.",
      "title": "Yazılım Müdürü",
      "requestedDate": "2026-02-26T14:00:00Z",
      "note": "Yeni proje görüşmesi",
      "status": "pending"
    }
  ]
}
```

### Talebi Onaylama
```dart
POST /api/meeting-requests/approve
Body:
{
  "id": "1"
}
```

### Revize Önerme
```dart
POST /api/meeting-requests/revise
Body:
{
  "id": "1",
  "proposedDate": "2026-02-27T10:00:00Z",
  "note": "Bu tarih daha uygun olur"
}
```

## 🎨 Tasarım Detayları

- Mor tema (#A855F7) görüşme talepleri için kullanıldı
- Kartlar modern, gölgeli ve yuvarlatılmış köşeli
- Responsive tasarım
- Smooth animasyonlar
- Türkçe tarih formatı (intl paketi kullanılıyor)

## 📦 Bağımlılıklar

Mevcut pubspec.yaml'daki paketler kullanıldı:
- `intl`: Tarih formatlaması için
- `flutter/material.dart`: UI için

Ek paket kurulumuna gerek yok!

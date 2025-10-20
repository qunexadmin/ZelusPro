# 🚀 Zelus Pro - Quick Setup Guide

## Prerequisites

Before you begin, ensure you have:
- ✅ Flutter 3.0+ installed (`flutter --version`)
- ✅ Dart 3.0+ installed
- ✅ Android Studio / VS Code with Flutter extension
- ✅ Access to the backend API (3.24.31.8:8006)

---

## Step-by-Step Setup

### 1. Clone & Navigate
```bash
git clone https://github.com/yourusername/Zelus_Pro.git
cd Zelus_Pro
```

### 2. Install Shared Packages

**Install zelus_api (API client & models):**
```bash
cd packages/zelus_api
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
cd ../..
```

**Install zelus_core (utilities):**
```bash
cd packages/zelus_core
flutter pub get
cd ../..
```

**Install zelus_ui (design system):**
```bash
cd packages/zelus_ui
flutter pub get
cd ../..
```

### 3. Install Mobile Pro App

```bash
cd mobile_pro
flutter pub get
```

### 4. Run the App

**On Chrome (Web):**
```bash
flutter run -d chrome
```

**On Android Emulator:**
```bash
flutter run -d emulator-5554
```

**On Physical Device:**
```bash
flutter run
```

---

## 🧪 Testing the App

### Login Credentials

**Stylist Account:**
- Email: `demo@zelus.com`
- Password: `password123`
- **What you'll see:** Stylist dashboard with booking management

**Salon Owner Account:**
- Email: `owner@zelus.com`
- Password: `password123`
- **What you'll see:** Salon dashboard with staff & analytics

### Test Flow

1. **Login Screen** → Enter credentials → Sign In
2. **Dashboard** → View stats, bookings, quick actions
3. **Calendar Tab** → View bookings, accept/reject requests
4. **Clients Tab** → Browse client list, view details
5. **Profile Tab** → Manage profile settings
6. **More Menu** → View earnings, logout

---

## 🛠️ Development Commands

### Code Generation (for freezed models)
```bash
cd packages/zelus_api
flutter pub run build_runner build --delete-conflicting-outputs
```

### Clean Build
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

### Run Tests
```bash
flutter test
```

### Format Code
```bash
flutter format .
```

### Analyze Code
```bash
flutter analyze
```

---

## 🔧 Configuration

### Change API Base URL

Edit `packages/zelus_api/lib/src/clients/api_config.dart`:
```dart
static const String baseUrl = 'http://YOUR_SERVER:8006/api/v1';
```

### Enable/Disable Features

Edit `packages/zelus_core/lib/src/constants/feature_flags.dart`:
```dart
class FeatureFlags {
  static const bool enableCalendar = true;
  static const bool enableClientManagement = true;
  // ... other flags
}
```

---

## 📱 Build for Production

### Android APK
```bash
cd mobile_pro
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle (for Play Store)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

### iOS (requires macOS)
```bash
flutter build ios --release
```

---

## 🐛 Troubleshooting

### Issue: "Package not found"
**Solution:**
```bash
cd packages/zelus_api && flutter pub get
cd ../zelus_core && flutter pub get
cd ../zelus_ui && flutter pub get
cd ../../mobile_pro && flutter pub get
```

### Issue: "Build runner errors"
**Solution:**
```bash
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: "API connection failed"
**Solution:**
- Check backend is running: `curl http://3.24.31.8:8006/health`
- Verify API URL in `api_config.dart`
- Check CORS settings in backend

### Issue: "Freezed files not generated"
**Solution:**
```bash
cd packages/zelus_api
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 📚 Next Steps

1. ✅ Read the [README.md](README.md) for full feature list
2. ✅ Check [API Documentation](http://3.24.31.8:8006/docs)
3. ✅ Explore the [packages](packages/) folder for shared code
4. ✅ Start building features!

---

## 🤝 Need Help?

- **Backend Issues:** Check backend logs on AWS EC2
- **Flutter Issues:** Run `flutter doctor`
- **API Issues:** Visit http://3.24.31.8:8006/docs
- **Code Issues:** Check GitHub Issues

---

Happy Coding! 🎉


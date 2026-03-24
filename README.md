# Dhikr Counter App 📿

A beautiful, minimalist Islamic Dhikr counter application built with Flutter. Track your daily remembrance of Allah (SWT) with an elegant, responsive interface that works seamlessly across iOS and Android devices.

**Developed by:** [Md. Sifatullah](https://www.sifatullah.tech/) | sifatullah.swe.617@gmail.com

---

## 📱 Quick Access

### Download APK
[![Download APK](https://img.shields.io/badge/Download-APK-green?style=for-the-badge&logo=android)](https://drive.google.com/file/d/1PI2lgEr_COhJwDmJgwCuRfzj-KwxCpmu/view?usp=sharing)

📥 **Direct Download:** [app-release.apk](https://drive.google.com/file/d/1PI2lgEr_COhJwDmJgwCuRfzj-KwxCpmu/view?usp=sharing)

> **Note:** If the direct download doesn't work, copy the APK to your device and install manually. You may need to enable "Install from Unknown Sources" in your Android settings.

### Watch Demo

<div align="center">
  <a href="https://drive.google.com/file/d/1c7DWWtc6AoaHMBfWxswRCOkLi0cdoIw3/view?usp=sharing" target="_blank">
    <video src="Simulator Screen Recording - iPhone 17 Pro Max - 2026-03-24 at 23.47.55.mov" controls width="320" style="max-width: 100%; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.3);">
      Your browser does not support the video tag.
    </video>
  </a>
  <br>
  <p>
    <a href="https://drive.google.com/file/d/1c7DWWtc6AoaHMBfWxswRCOkLi0cdoIw3/view?usp=sharing" target="_blank">
      <img src="https://img.shields.io/badge/📥-Download%20Video-red?style=for-the-badge" alt="Download Video">
    </a>
  </p>
</div>

> **Video not playing?** Open the [Google Drive link](https://drive.google.com/file/d/1c7DWWtc6AoaHMBfWxswRCOkLi0cdoIw3/view?usp=sharing) directly in your browser.

---

## 📖 Table of Contents

- [Project Overview](#-project-overview)
- [Features](#-features)
- [Setup Instructions](#-setup-instructions)
- [Project Structure](#-project-structure)
- [State Management (Riverpod)](#-state-management-riverpod)
- [Assumptions Made](#-assumptions-made)
- [Improvements Beyond Reference UI](#-improvements-beyond-reference-ui)
- [Technical Details](#-technical-details)
- [Screenshots](#-screenshots)

---

## 🎯 Project Overview

### What I Built

Dhikr is a spiritual companion app designed to help Muslims keep track of their daily dhikr (remembrance of Allah). The app provides:

- **Tap Counter**: Beautiful circular interface for manual dhikr counting
- **Target Goals**: Customizable targets (33, 99, 100) for structured dhikr sessions
- **Progress Tracking**: Real-time percentage completion display
- **Global Live Count**: Simulated community counter showing collective recitations
- **Session Management**: Track progress within individual sessions
- **Completion Dialogs**: Celebratory feedback when targets are reached
- **Exit Confirmation**: Prevents accidental app closure

### Design Philosophy

The app follows a **dark-themed, minimalist design** with gold accents inspired by traditional Islamic art patterns. The interface prioritizes:
- Spiritual focus through minimal distractions
- Large, accessible touch targets
- Smooth animations for a meditative experience
- Clear visual feedback for each recitation

---

## ✨ Features

### Core Features
- ✅ **Manual Tap Counter** - Tap the circular dhikr button to count
- ✅ **Haptic Feedback** - Subtle vibration on each tap (iOS/Android)
- ✅ **Customizable Targets** - Set goals to 33, 99, or 100 recitations
- ✅ **Progress Bar** - Visual percentage indicator of session progress
- ✅ **Completion Dialog** - Beautiful celebration when target is reached
- ✅ **Exit Confirmation** - Prevents accidental app exit
- ✅ **Global Counter** - Live simulated count of all recitations today

### UI/UX Features
- ✅ **Dark Theme** - Easy on the eyes for extended use
- ✅ **Gold Accents** - Premium Islamic aesthetic
- ✅ **Smooth Animations** - Scale animation on each tap
- ✅ **Responsive Design** - Adapts to all screen sizes
- ✅ **Safe Area Support** - Works on notched devices

---

## 🚀 Setup Instructions

### Prerequisites

Before you begin, ensure you have the following installed:

1. **Flutter SDK** (v3.11.1 or higher)
   - Download from [flutter.dev](https://flutter.dev/docs/get-started/install)
   - Verify installation: `flutter doctor`

2. **Dart SDK** (v3.11.1 or higher)
   - Comes bundled with Flutter

3. **IDE** (Choose one):
   - [VS Code](https://code.visualstudio.com/) with Flutter extension
   - [Android Studio](https://developer.android.com/studio) with Flutter plugin

4. **Platform Requirements**:
   - **Android**: Android SDK, Android Studio
   - **iOS**: Xcode 15+ (macOS only), CocoaPods

### Installation Steps

#### 1. Clone the Repository

```bash
git clone <repository-url>
cd Dhikr
```

#### 2. Install Dependencies

```bash
flutter pub get
```

#### 3. Generate Code (Riverpod)

```bash
dart run build_runner build --delete-conflicting-outputs
```

#### 4. Run the App

**For Android:**
```bash
flutter run
```

**For iOS:**
```bash
flutter run
```

**For Release Build:**

Android:
```bash
flutter build apk --release
```

iOS:
```bash
flutter build ios --release
```

### Troubleshooting

**Issue: Build Runner Errors**
```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

**Issue: iOS Build Fails**
```bash
cd ios
pod install
cd ..
flutter build ios
```

**Issue: Android Build Fails**
```bash
cd android
./gradlew clean
cd ..
flutter build apk
```

---

## 📁 Project Structure

```
Dhikr/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── app.dart                     # Main app widget & configuration
│   │
│   ├── core/                        # Core application utilities
│   │   ├── constants/
│   │   │   └── app_constants.dart   # App-wide constants (dhikr text, targets)
│   │   └── theme/
│   │       └── app_theme.dart       # Theme configuration (dark mode, colors)
│   │
│   ├── features/                    # Feature-based organization
│   │   ├── dhikr/                   # Dhikr counter feature
│   │   │   ├── models/
│   │   │   │   └── dhikr_counter_state.dart  # State model for counter
│   │   │   ├── providers/
│   │   │   │   ├── dhikr_counter_provider.dart    # Riverpod providers
│   │   │   │   └── dhikr_counter_provider.g.dart  # Generated code
│   │   │   └── presentation/
│   │   │       ├── screens/
│   │   │       │   └── dhikr_counter_screen.dart  # Main counter screen
│   │   │       └── widgets/
│   │   │           ├── dhikr_circle.dart          # Main dhikr button
│   │   │           ├── session_goal_bar.dart      # Progress indicator
│   │   │           └── voice_toggle_button.dart   # Mode toggle button
│   │   │
│   │   └── splash/                    # Splash screen feature
│   │       └── presentation/
│   │           └── screens/
│   │               └── splash_screen.dart  # App launch animation
│   │
│   └── gen/                         # Generated files (auto-generated)
│       ├── assets.gen.dart          # Asset type-safety
│       └── colors.gen.dart          # Color type-safety
│
├── assets/
│   ├── images/                      # Image assets
│   │   └── shpper-logo-with-yellow.png
│   └── colors/
│       └── colors.xml               # Color definitions
│
├── test/                            # Unit & widget tests
│
├── android/                         # Android platform files
├── ios/                             # iOS platform files
│
├── pubspec.yaml                     # Dependencies & assets config
├── analysis_options.yaml            # Linter rules
└── README.md                        # This file
```

### Architecture Pattern: **Feature-First MVVM**

```
┌─────────────────────────────────────────────────┐
│                  Presentation Layer              │
│  ┌─────────────┐  ┌─────────────────────────┐   │
│  │   Screens   │  │        Widgets          │   │
│  │  (Views)    │  │   (Reusable Components) │   │
│  └──────┬──────┘  └────────────┬────────────┘   │
│         │                      │                 │
│         └──────────┬───────────┘                 │
│                    │                             │
│         ┌──────────▼───────────┐                 │
│         │   WidgetRef.watch()  │                 │
│         └──────────┬───────────┘                 │
└────────────────────│─────────────────────────────┘
                     │
┌────────────────────▼─────────────────────────────┐
│               State Management Layer              │
│  ┌─────────────────────────────────────────┐     │
│  │          Riverpod Providers             │     │
│  │  - DhikrCounter (Notifier)              │     │
│  │  - GlobalCount (Stream)                 │     │
│  │  - VoiceMode (Notifier)                 │     │
│  └─────────────────────────────────────────┘     │
└────────────────────│─────────────────────────────┘
                     │
┌────────────────────▼─────────────────────────────┐
│                   Domain Layer                   │
│  ┌─────────────────────────────────────────┐     │
│  │            Models & State               │     │
│  │  - DhikrCounterState                    │     │
│  │  - Business Logic (isCompleted, etc.)   │     │
│  └─────────────────────────────────────────┘     │
└───────────────────────────────────────────────────┘
```

---

## 🏛️ State Management (Riverpod)

### Why Riverpod?

I chose **Riverpod** for state management because of its:

1. **Compile-time Safety** - No runtime errors from missing providers
2. **No Context Dependency** - Access state anywhere without BuildContext
3. **Automatic Disposal** - Memory management handled automatically
4. **Testing Friendly** - Easy to mock and test providers
5. **Code Generation** - Type-safe providers with `@riverpod` annotation

### Provider Architecture

#### 1. **DhikrCounter** (NotifierProvider)

```dart
@riverpod
class DhikrCounter extends _$DhikrCounter {
  @override
  DhikrCounterState build() => const DhikrCounterState(
    currentCount: 0,
    targetCount: 33,
  );

  void increment() {
    if (state.isCompleted) return;
    state = state.copyWith(currentCount: state.currentCount + 1);
  }

  void reset() {
    state = state.copyWith(currentCount: 0);
  }

  void setTarget(int target) {
    state = DhikrCounterState(currentCount: 0, targetCount: target);
  }
}
```

**Purpose**: Manages the dhikr counter state (current count, target count)

**Usage in Widgets**:
```dart
// Watch state (rebuilds on change)
final state = ref.watch(dhikrCounterProvider);

// Call methods
ref.read(dhikrCounterProvider.notifier).increment();
```

#### 2. **GlobalCount** (StreamProvider)

```dart
@riverpod
Stream<int> globalCount(Ref ref) async* {
  final rng = Random();
  var count = AppConstants.globalCountSeed;
  yield count;
  while (true) {
    await Future<void>.delayed(
      Duration(milliseconds: 2000 + rng.nextInt(1000))
    );
    count += 1 + rng.nextInt(4);
    yield count;
  }
}
```

**Purpose**: Simulates a live global counter of all recitations

**Features**:
- Increments every 2-3 seconds
- Random increment values (1-4)
- Starts from seed value (2,841,092)

#### 3. **VoiceMode** (NotifierProvider)

```dart
@riverpod
class VoiceMode extends _$VoiceMode {
  @override
  bool build() => false;

  void toggle() => state = !state;
}
```

**Purpose**: Toggles between tap and voice input modes

**Note**: Currently UI-only; voice feature is placeholder for future implementation

### State Flow Diagram

```
┌─────────────────┐
│   User Taps     │
│   Dhikr Circle  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Haptic Feedback│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ increment()     │
│ (Provider)      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ State Updated   │
│ copyWith()      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Widgets Rebuild │
│ (ref.watch)     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Check isCompleted│
│ Show Dialog     │
└─────────────────┘
```

### Optimization Techniques Used

1. **Selective Watching** - Only rebuild when specific fields change:
   ```dart
   final currentCount = ref.watch(
     dhikrCounterProvider.select((s) => s.currentCount)
   );
   ```

2. **Computed Properties** - State calculates its own derived values:
   ```dart
   bool get isCompleted => currentCount >= targetCount;
   double get progress => (currentCount / targetCount).clamp(0.0, 1.0);
   ```

3. **Immutable State** - Uses `copyWith()` pattern for predictable updates

---

## 🤔 Assumptions Made

### Design Assumptions

1. **Dark Theme Only** - The app uses a single dark theme based on the reference UI. No light theme toggle was implemented.

2. **Fixed Dhikr Text** - The dhikr "SubhanAllah" (سبحان الله) is hardcoded. Users cannot customize the dhikr text.

3. **Single Dhikr Type** - Only one type of dhikr is supported. No library of different dhikr phrases.

### Functional Assumptions

1. **Global Count is Simulated** - The "Global Live Count" is a simulated stream, not a real-time server connection. This was done because:
   - No backend infrastructure was specified
   - Keeps the app fully offline-capable
   - Demonstrates StreamProvider usage

2. **Voice Mode is UI-Only** - The voice toggle button exists but doesn't activate voice recognition. This is a placeholder for future implementation.

3. **Target Options Limited** - Only 33, 99, and 100 are available as target options, as specified in the reference.

4. **No Persistence** - Counter resets when app is closed. No local storage was implemented as it wasn't in the requirements.

### Technical Assumptions

1. **iOS Target: iPhone 17 Pro Max** - Development was tested against the latest iPhone simulator.

2. **Minimum Android API: 21** - Following Flutter defaults for broad device compatibility.

3. **No Unit Tests** - Tests were not included as the focus was on UI/UX implementation.

---

## 🎨 Improvements Beyond Reference UI

### 1. Enhanced Animations

**What I Added**:
- **Scale Animation on Tap**: The dhikr circle smoothly scales to 95% on tap and returns with a spring effect
- **Staggered Splash Animation**: Logo and text animate in sequence for a polished first impression
- **AnimatedSwitcher for Mode Text**: Smooth crossfade when switching between TAP/SPEAK modes

**Code Example**:
```dart
_controller = AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 90),
  reverseDuration: const Duration(milliseconds: 130),
);
```

### 2. Improved State Management

**What I Added**:
- **Selective Rebuilds**: Using `.select()` to minimize widget rebuilds
- **Computed Properties**: State calculates its own progress, completion status
- **Type-Safe State**: Immutable state class with `copyWith()` pattern

### 3. Better UX Details

**What I Added**:
- **Haptic Feedback**: Light impact vibration on each tap for tactile response
- **Dialog Prevention**: `_isShowingDialog` flag prevents multiple dialogs
- **Debounced Completion**: 400ms delay before showing completion dialog
- **Exit Confirmation**: Prevents accidental app closure

### 4. Code Quality

**What I Added**:
- **Feature-First Structure**: Organized by feature, not by type
- **Riverpod Code Generation**: Using `@riverpod` annotation for type safety
- **Generated Assets**: Type-safe asset access with `flutter_gen`
- **Comprehensive Comments**: ASCII separators and inline documentation

### 5. Visual Polish

**What I Added**:
- **Glow Effects**: Subtle box shadows on the dhikr circle
- **Gradient Borders**: Multiple border layers with varying opacity
- **Letter Spacing**: Carefully tuned typography for readability
- **Safe Area Handling**: Proper padding for notched devices

### 6. Developer Experience

**What I Added**:
- **Detailed README**: This comprehensive documentation
- **Clear File Structure**: Logical organization for easy navigation
- **Reusable Widgets**: Components are modular and extractable
- **Consistent Naming**: Predictable patterns throughout codebase

---

## 🔧 Technical Details

### Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_riverpod` | ^3.1.0 | State management |
| `riverpod_annotation` | 4.0.0 | Code generation |
| `flutter_screenutil` | ^5.9.3 | Responsive sizing |
| `riverpod_generator` | 4.0.0+1 | Provider code gen |
| `flutter_gen_runner` | ^5.13.0+1 | Asset code gen |

### Key Design Decisions

1. **ConsumerStatefulWidget vs ConsumerWidget**:
   - Used `ConsumerStatefulWidget` for `DhikrCircle` to manage animation controller
   - Used `ConsumerWidget` for simple stateless components

2. **Animation Timing**:
   - 90ms forward duration for snappy feedback
   - 130ms reverse duration for natural decay
   - 400ms delay before completion dialog for visual flow

3. **Color Palette**:
   - All colors defined in `colors.xml` for consistency
   - Gold accent (#D4AF37 equivalent) for Islamic aesthetic
   - Dark backgrounds for reduced eye strain

### Performance Optimizations

1. **Minimized Rebuilds**: `.select()` for fine-grained reactivity
2. **Animation Controller Reuse**: Single controller, not recreated
3. **Const Constructors**: Wherever possible for compile-time constants
4. **Efficient String Interpolation**: Direct `$variable` in Text widgets

---

## 📸 Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="Simulator Screenshot - iPhone 17 Pro Max - 2026-03-25 at 00.05.50.png" width="200" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.3);" alt="Main Counter Screen"/><br/>
        <sub>Main Counter Screen</sub>
      </td>
      <td align="center">
        <img src="Simulator Screenshot - iPhone 17 Pro Max - 2026-03-25 at 00.06.03.png" width="200" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.3);" alt="Progress Tracking"/><br/>
        <sub>Completion Dialog</sub>
      </td>
      <td align="center">
        <img src="Simulator Screenshot - iPhone 17 Pro Max - 2026-03-25 at 00.06.10.png" width="200" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.3);" alt="Completion Dialog"/><br/>
        <sub>Exit Dialog</sub>
      </td>
    </tr>
  </table>
</div>

---

## 📞 Contact & Support

For questions or issues related to this implementation:

- **Email**: sifatullah.swe.617@gmail.com
- **Portfolio**: [www.sifatullah.tech](https://www.sifatullah.tech/)
- **LinkedIn**: [Md. Sifatullah](https://www.linkedin.com/in/sifatullah-swe/)
- **GitHub**: [Md. Sifatullah](https://github.com/sifatullah-swe)

---

## 📄 License

This project is created as part of a technical assessment. All rights reserved.

---

## 🙏 Acknowledgments

- **Flutter Team** - For the amazing Flutter framework
- **Riverpod** - For the excellent state management solution
- **Islamic Art** - For the beautiful design inspiration

---

<div align="center">

**Built with ❤️ for the Muslim Ummah**

*May this app help us all remember Allah (SWT) more often*

**وَاذْكُرُوا اللَّهَ كَثِيرًا لَّعَلَّكُمْ تُفْلِحُونَ**

*"And remember Allah often that you may succeed."* - Quran 8:45

</div>

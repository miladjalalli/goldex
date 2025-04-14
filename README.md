
# Goldex Flutter App

Goldex is a Flutter-based mobile application that provides features for gold-related activities. This application is built with a clean architecture and supports both Android and iOS platforms.

## ✨ Features

- User authentication and onboarding
- Realtime gold price display
- Gold item scanning and evaluation
- Secure backend API integration
- Clean and modular code architecture
- State management using `flutter_bloc`
- Custom UI components

## 🚀 Getting Started

These instructions will help you set up the project locally.

### 📦 Prerequisites

- Flutter SDK (version 3.19.6 or higher recommended)  
  [Install Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio / VSCode
- Dart SDK
- A device or emulator

### 🛠 Installation

1. Clone the repository:
   ```bash
   git clone "YOUR-REPOSITORY"
   cd goldex
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate necessary files (if using freezed, json_serializable, etc.):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## 📁 Project Structure

```bash
lib/
├── core/             # Common utilities, constants, resources
├── data/             # Data sources and models
├── domain/           # Business logic and repositories
├── presentation/     # UI screens and widgets
├── main.dart         # Entry point
```

## 📦 Dependencies

Here are some main dependencies used:

- `flutter_bloc` – Bloc state management
- `dio` – HTTP networking
- `equatable` – For value equality
- `get_it` – Dependency injection
- `json_serializable` – JSON model generation
- `build_runner` – Code generation

Check `pubspec.yaml` for the full list.

## 🧪 Testing

Run unit or widget tests with:

```bash
flutter test
```

## 📷 Screenshots

*(Add screenshots of the app here)*

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙋‍♂️ Author

- **Milad Jalali**  
  [GitHub](https://github.com/miladjalalli)

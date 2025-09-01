
# 📱 learning_go_test

A new **Flutter project** built with **Bloc**, **Dio**, **GetIt**, **Injectable**, **Hive** for persistence, and **EasyLocalization** for multilingual support.

---

## 📦 Dependencies

### Main

```yaml
dependencies:
  flutter:
    sdk: flutter
  bloc: ^9.0.0
  flutter_bloc: ^9.1.1
  equatable: ^2.0.7
  get_it: ^8.2.0
  injectable: ^2.5.1
  dio: ^5.9.0
  retrofit: ^4.7.2
  json_serializable: ^6.11.0
  json_annotation: ^4.9.0
  easy_localization: ^3.0.8
  flutter_screenutil: ^5.9.3
  dartz: ^0.10.1
  bot_toast: ^4.1.3
  cached_network_image: ^3.4.1
  colorize: ^3.0.0
  connectivity_plus: ^6.1.5
  firebase_core: ^4.0.0
  flutter_dotenv: ^6.0.0
  go_router: ^16.2.1
  path_provider: ^2.1.5
  skeletonizer: ^2.1.0+1
  flutter_svg: ^2.2.0
  lottie: ^3.3.1
  flutter_secure_storage: ^9.2.4
  hive_ce: ^2.11.3
  hive_ce_flutter: ^2.3.2
  drift: ^2.28.1
  drift_flutter: ^0.2.5
  sqlite3_flutter_libs: ^0.5.39
```

### Dev

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.7.0
  injectable_generator: ^2.8.1
  retrofit_generator: ^10.0.2
  pretty_dio_logger: ^1.4.0
  hive_ce_generator: ^1.9.3
```

---

## 🎨 Fonts

* **Poppins** is the main project font.

---

## 🌍 Localization

This project uses **easy_localization**.

### Generate locale files

```bash
dart run easy_localization:generate --source-dir ./assets/i18n/;
dart run easy_localization:generate --source-dir ./assets/i18n -f keys -o locale_keys.g.dart
```

Use translations in widgets:

```dart
Text(LocaleKeys.hello.tr())
```

---

## ⚙️ Code Generation

Run build_runner to generate `.g.dart` and injectable/retrofit files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🏗️ Project Structure

```plaintext
lib/
 ├── app/
 │   └── features/
 │        ├── auth/
 │        │    └── features/sign_in/
 │        ├── home/
 │        ├── init_app/presentation/bloc/
 │        ├── product_details/
 │        ├── profile/
 │        ├── search_products/
 │        └── splash/
 ├── generated/              # auto-generated localization
 ├── src/
 │   ├── core/               # interceptors, utils, base classes
 │   ├── errors/             # custom exceptions
 │   ├── localization/       # localization config
 │   ├── logger/             # logging utils
 │   └── resources/          # theme, assets
 ├── hive_registrar.g.dart   # Hive type adapters
 └── main.dart
```

---

## ✨ Features

* **Authentication**

  * Sign in, token management with `flutter_secure_storage`.
  * Dio interceptor for refresh & retry.
* **Home**

  * Product listing with pagination + pull-to-refresh.
  * Infinite scrolling with skeleton loaders.
* **Profile**

  * User data (company, role, address, crypto wallet).
  * Masked sensitive info (SSN, EIN, Wallet).
* **Search Products**

  * Search with filters & responsive UI.
* **Product Details**

  * Detailed product screen with caching.
* **Splash & Init**

  * Initialization logic, dependency injection with `get_it` + `injectable`.

---

## 🔑 Authentication Flow

1. Every request includes Access Token.
2. On `401 Unauthorized`:

   * Interceptor refreshes token.
   * If success → retry request.
   * If fail → clear storage & trigger `logout`.
3. `AuthBloc` listens for logout events → redirects to sign-in.

---

## 🧪 Development

### Run the app

```bash
flutter run
```

### Format

```bash
dart format .
```

---

## 📘 Guides

### Adding a new feature

1. Create a new folder under `app/features/<feature_name>`.
2. Follow feature-first structure (`presentation`, `bloc`, `data`, `domain`).
3. Register dependencies with `injectable`.
4. Run build_runner to generate DI code.

Generate:

```bash
flutter pub run build_runner build
```

---

✌️ Built with **Flutter + Bloc + Dio + Drift + Hive + EasyLocalization**

---

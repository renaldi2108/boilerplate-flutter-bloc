# Flutter Boilerplate with BLoC and DDD

A streamlined Flutter boilerplate implementing **Domain-Driven Design (DDD)** and **BLoC** state management. Designed for scalable, testable, and modular applications.  

## ✨ Features

- **DDD Architecture**: Organized layers for domain, data, and presentation.
- **BLoC State Management**: Reactive and efficient.
- **Dependency Injection**: Powered by `injectable` and `get_it`.
- **Networking**: HTTP requests with `dio` and `pretty_dio_logger`.
- **Debugging**: HTTP inspector with `alice`.
- **Functional Programming**: `dartz` for `Either` and `Option`.
- **Immutable Models**: Built with `freezed`.

## 📂 Project Structure

```
lib/
├── data/            # Data layer
│   ├── local/       # Local data sources (e.g., database, cache)
│   └── remote/      # Remote data sources (e.g., API services)
│       ├── service_name/ # Specific remote services
│       │   └── param/    # Parameters for API requests
├── domain/          # Domain layer
│   ├── entity/      # Core entities
│   ├── repository/  # Repository interfaces
│   └── usecase/     # Use case definitions
├── presentation/    # Presentation layer
│   ├── feature_name/ # Modular features
│   │   ├── bloc/    # BLoC logic
│   │   └── page/    # UI pages
├── shared/          # Shared resources
│   ├── core/        # Core utilities and constants
│   └── utils/       # Reusable utility functions
└── main.dart        # App entry point
```

## 🛠️ Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/renaldi2108/boilerplate-flutter-bloc.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Generate dependency injection:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## 📦 Dependencies

- `flutter_bloc` for state management.
- `injectable` & `get_it` for dependency injection.
- `dio` & `pretty_dio_logger` for HTTP requests.
- `alice` for debugging.
- `dartz` for functional programming.
- `freezed` for immutable models.

## 🤝 Contributions

Contributions are welcome! Feel free to open issues or submit pull requests.

## 📄 License

This project is licensed under the MIT License.

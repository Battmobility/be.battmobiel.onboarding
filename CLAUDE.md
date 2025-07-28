# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter package (`batt_onboarding`) that provides onboarding functionality for BattMobility/MobilityOS. It's a modular Flutter package designed to be consumed by other Flutter applications to handle user onboarding workflows.

## Development Commands

### Core Flutter Commands
- `flutter pub get` - Install dependencies
- `flutter analyze` - Run static analysis (uses `package:lints/recommended.yaml`)
- `flutter test` - Run tests
- `flutter pub run build_runner build` - Generate code (for Chopper API clients and other generated code)
- `flutter pub run build_runner build --delete-conflicting-outputs` - Clean build and regenerate code

### Code Generation
The project uses build_runner for code generation, specifically:
- Chopper generator for API clients
- Swagger Dart code generator for API models from OpenAPI specs

## Architecture

### Package Structure
```
lib/
├── batt_onboarding.dart          # Main export file
├── l10n/                         # Localization files (generated)
└── src/
    ├── data/                     # Data layer
    │   ├── api_factory.dart      # API client factory
    │   ├── auth_interceptor.dart # HTTP authentication
    │   ├── onboarding_datasource.dart
    │   ├── onboarding_service.dart
    │   └── token_service.dart
    ├── domain/                   # Business logic layer
    │   ├── *_mapper.dart         # Data mappers
    │   ├── onboarding_progress.dart
    │   ├── onboarding_repository.dart
    │   └── subscription.dart
    ├── presentation/             # UI layer
    │   ├── pages/               # Individual onboarding pages
    │   └── widgets/             # Reusable UI components
    └── util/                    # Utilities
        ├── analytics/           # Analytics tracking
        └── l10n/               # Localization resources
```

### Key Dependencies
- **Chopper**: HTTP client for API communication
- **Dio**: Alternative HTTP client 
- **flutter_form_builder**: Form handling
- **google_mlkit_text_recognition**: OCR for document scanning
- **image_picker/image_cropper**: Document capture
- **pinput**: PIN/code input
- **batt_ds**: Internal design system (from Git)
- **batt_kit**: Internal API kit (from Git)

### Architecture Pattern
- **Clean Architecture**: Separated into data, domain, and presentation layers
- **Repository Pattern**: `OnboardingRepository` acts as interface between data and domain
- **Provider Pattern**: Uses `onboarding_repository_provider.dart` for dependency injection

### Onboarding Flow
The package handles a multi-step onboarding process:
1. Personal information collection
2. Address details
3. Phone verification
4. Document upload (ID, driver's license)
5. Legal agreements
6. Formula/subscription selection
7. Client and contract creation

### API Integration
- Uses OpenAPI/Swagger code generation for type-safe API clients
- API endpoints are filtered to specific onboarding-related paths (see `build.yaml`)
- Authentication handled via interceptors with bearer tokens

### Localization
- Supports EN, FR, NL languages
- Uses Flutter's internationalization system with ARB files
- Generated localization classes in `l10n/` directory

### Analytics
Built-in analytics tracking with configurable event and page view callbacks.

## Testing
Tests are located in the `test/` directory. The example app in `example/` can be used for manual testing and integration.
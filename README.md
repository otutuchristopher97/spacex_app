# SpaceX App

A Flutter application following Clean Architecture principles to interact with SpaceX data.

## Table of Contents

- [Introduction](#introduction)
- [Architecture](#architecture)
- [Features](#features)
- [Installation](#installation)
- [Dependencies](#dependencies)
- [Folder Structure](#folder-structure)
- [License](#license)

## Introduction

This project is a starting point for a Flutter application using Clean Architecture. It integrates popular packages such as `bloc`, `http`, and `get_it` to maintain a scalable and maintainable codebase.

## Architecture

This project follows Clean Architecture principles:
- **Presentation Layer:** Handles UI and user interactions using Flutter widgets and `bloc` for state management.
- **Domain Layer:** Contains business logic, use cases, and entity definitions.
- **Data Layer:** Manages API calls, local storage, and repository implementations.

### Dependency Injection


## Features

- Fetch and display SpaceX data
- Implement Bloc for state management
- Dependency injection using `get_it`
- Lottie animations for UI enhancements

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/spacex_app.git
   cd spacex_app
   ```

2. Install dependencies:
   ```sh
   flutter pub get
   ```

3. Run the application:
   ```sh
   flutter run
   ```


## Folder Structure

```
lib/
│── core/                # Common utilities, error handling, and constants
│── resources/           # Themes, colors, media assets
│── service/             # Dependency injection setup
│── utils/               # Helper functions, constants
│── src/                 # Feature-based modules
│   ├── onboarding/
│   │   ├── presentation/view/
│── spacex/
│   ├── data/            # Data layer: API calls, repository implementation
│   ├── domain/          # Domain layer: Entities, use cases, repository interfaces
│   ├── presentation/    # UI layer: Screens, widgets, state management
│       ├── cubit/       # Bloc state management
│       ├── view/        # UI views
│── main.dart            # Entry point of the app
```

## License

This project is licensed under the MIT License. Feel free to use and modify it.
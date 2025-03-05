# SpaceX App

A Flutter application following Clean Architecture principles to interact with SpaceX data.

## Table of Contents

- [Introduction](#introduction)
- [Architecture](#architecture)
- [Features](#features)
- [Installation](#installation)
- [Technical Choices](#technical-choices)
- [Assumptions and Trade-offs](#assumptions-and-trade-offs)
- [Test](#test)

## Introduction

This project is a starting point for a Flutter application using Clean Architecture. It integrates popular packages such as `bloc`, `http`, and `get_it` to maintain a scalable and maintainable codebase.

## Architecture

This project follows Clean Architecture principles:
- **Presentation Layer:** Handles UI and user interactions using Flutter widgets and `bloc` for state management.
- **Domain Layer:** Contains business logic, use cases, and entity definitions.
- **Data Layer:** Manages API calls, local storage, and repository implementations.

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

## Technical Choices

- **Clean Architecture:** Used to maintain separation of concerns, making the app scalable and testable.
- **Bloc for State Management:** Chosen for predictable state handling and separation of UI from business logic.
- **Dependency Injection with get_it:** Allows easy injection of dependencies, improving testability.
- **Dartz for Functional Programming:** Helps in handling failures and ensuring code robustness.
- **Lottie Animations:** Used for enhancing UI with animations without impacting performance.

## Assumptions and Trade-offs

- **Assumption:** The app fetches SpaceX data from an external API and assumes the API structure will remain stable.
- **Trade-off:** Used `flutter_bloc` for state management instead of Riverpod or Provider due to better maintainability in large projects.
- **Assumption:** The app primarily targets mobile platforms (iOS & Android) and does not yet support web or desktop.
- **Trade-off:** Used `http` for API requests to keep dependencies minimal and avoid additional configuration.

## Test

We have written tests to ensure the functionality of the application, focusing on data fetching, repository implementation, and API failure handling.

### Running Tests
To execute the tests, run the following command:
```sh
flutter test
```

# poloniex_app

## Overview

Welcome to the Poloniex App case study repository! This repository contains the codebase for a Flutter application designed to demonstrate various features related to cryptocurrency trading on the Poloniex platform. The app showcases features such as sign-in, sign-up, and trading functionalities.

## Getting Started

To run the project locally, follow these steps:

1. Clone or download the project and open it in either Android Studio or Visual Studio Code.
2. Ensure that the Flutter SDK is installed and the path is linked with the environment. Refer to the [official Flutter documentation](https://docs.flutter.dev/get-started/install) for installation instructions.
3. Open a terminal and navigate to the project directory. Run the command `flutter run` to launch the application. Alternatively, if you're using Android Studio, simply click on the play button.

## Architecture

The project follows a modular architecture, divided into shared and feature modules:

- **Features**: Contains modules for sign-in, sign-up, and trading functionalities.
- **Shared**: Contains base data, network, use cases, and widgets shared across the application.

Each layer of the architecture is designed to be testable, promoting code quality and maintainability.

## Trading

The trading module comprises three main layers:

1. **Data Layer**:
   - Includes the `TradingRepository`, responsible for fetching data from the WebSocket service.

2. **Domain Layer**:
   - Consists of the `SubscribeToStockMarketUseCase`, responsible for observing changes and mapping data models to domain models.

3. **Presentation Layer**:
   - Features the `TradingNotifier`, which observes changes from the use case, generates UI states, and maps them to UI data.

## State Management

The application utilizes Riverpod for state management, offering several benefits:

- Automatic memory disposal with AutoDispose.
- Simple and elegant state observation.
- Built-in dependency injection capabilities.

By leveraging Riverpod, the codebase maintains a high level of flexibility and scalability. For instance, switching between different implementations of `TradingRepository`, such as `MockTradingRepository` or `LocalTradingRepository`, is straightforward.

```dart
final tradingRepositoryProvider = Provider<TradingRepository>((ref) {
  final socketService = ref.watch(webSocketServiceProvider);
  final repository = TradingRemoteRepository(socketService);
  return repository;
});

## Additional Features

- **Retry Mechanism**: The app includes an  retry mechanism for connecting to the WebSocket service. In case of a connection failure/service stopped, Pull to refresh it like [ Pull to refresh image sample](https://i.stack.imgur.com/tlx4d.gif) 
- **Unit Tests for TradingNotifier**: The TradingNotifier, a crucial component responsible for managing trading-related state and UI updates, is thoroughly tested using unit tests. These tests validate the behavior and functionality of the TradingNotifier under various scenarios, ensuring its robustness and reliability.

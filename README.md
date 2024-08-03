# flutter_magenta

## Introduction

This project consolidates my previous simple Flutter apps into one application.

## Features

- **GitHub_Search** - Search for GitHub repositories.
- **Flutter_Weather** - View weather information using a weather API.

## Installation

To get started with this project, follow these steps:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/MagentaII/Flutter_Magenta.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd flutter_magenta
    ```

3. **Install dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the application:**

    ```bash
    flutter run
    ```

## Packages

#### Dependencies

- `cupertino_icons: ^1.0.6`
- `google_fonts: ^6.2.1`

#### Dev Dependencies

- `flutter_lints: ^4.0.0`

## Project Structure

The project directory is organized as follows:

```lua
flutter_magenta
|-- lib/
  |-- screens/
    |-- flutter_weather/
    |-- github_search/
    |-- home/
  |-- app.dart
  |-- app_view.dart
  |-- main.dart
```

```lua
flutter_magenta/lib/screens/flutter_weather/
|-- blocs/
  |-- weather_bloc.dart
  |-- weather_event.dart
  |-- weather_state.dart
|-- models/
  |-- weather.dart
|-- views/
  |-- weather/
    |-- weather_view.dart
  |-- search/
    |-- weather_search_view.dart
  |-- setting/
    |-- weather_setting_view.dart
|-- widgets/
  |-- weather_empty.dart
  |-- weather_error.dart
  |-- weather_loading.dart
  |-- weather_populated.dart
  |-- widgets.dart (Barrel Files)
```

```lua
flutter_magenta/lib/screens/github_search/
|-- blocs/
  |-- github_search_bloc.dart
  |-- github_search_event.dart
  |-- github_search_state.dart
|-- views/
  |-- github_search_view.dart
|-- widgets/
  |-- search_result_item.dart
  |-- search_results.dart
```

```lua
flutter_magenta/lib/screens/home/
|-- views/
  |-- home_view.dart
|-- widgets/
  |-- home_list_item.dart
```

The package directory is organized as follows:

```lua
flutter_magenta/packages/
|-- github_search/
  |-- github_api_client/
  |-- github_repository/
|-- weather_search/
  |-- weather_api_client/
  |-- weather_repository/
```

```lua
flutter_magenta/packages/github_search/github_api_client/
|-- lib/
  |-- src/
    |-- models/
      |-- github_user.dart
      |-- models.dart (Barrel Files)
      |-- search_result.dart
      |-- search_result_error.dart
      |-- search_result_item.dart
    |-- github_api_client.dart
  |-- github_api_client.dart (Barrel Files)
```

```lua
flutter_magenta/packages/github_search/github_repository/
|-- lib/
  |-- src/
    |-- models/
      |-- models.dart (Barrel Files)
      |-- repository_result_item.dart
      |-- repository_search_error.dart
      |-- repository_search_result.dart
    |-- github_cache.dart
    |-- github_repository.dart
  |-- github_repository.dart (Barrel Files)
```

```lua
flutter_magenta/packages/weather_search/weather_api_client/
|-- lib/
  |-- src/
    |-- models/
      |-- location.dart
      |-- models.dart (Barrel Files)
      |-- weather.dart
    |-- weather_api_client.dart
  |-- weather_api_client.dart (Barrel Files)
```

```lua
flutter_magenta/packages/weather_search/weather_repository/
|-- lib/
  |-- src/
    |-- models/
      |-- models.dart (Barrel Files)
      |-- weather.dart
    |-- weather_repository.dart
  |-- weather_repository.dart (Barrel Files)
```

## Acknowledgments

- The [cupertino_icons](https://pub.dev/packages/cupertino_icons) package for iOS-style icons.
- The [flutter_lints](https://pub.dev/packages/flutter_lints) package for linting.
- The [google_fonts](https://pub.dev/packages/google_fonts) package for beautiful fonts.

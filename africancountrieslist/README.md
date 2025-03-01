# African Countries App

A Flutter application that displays information about African countries using the REST Countries API.

## Features

- View a list of African countries with their flags
- See detailed information about each country including:
  - Capital city
  - Languages spoken
  - National flag
- Modern and responsive UI design
- BLoC pattern for state management
- Error handling and loading states

## Architecture

The app follows a clean architecture pattern with the following layers:

- **Core**: Constants, themes, and utilities
- **Data**: Models, repositories, and services
- **Presentation**: BLoC (Business Logic Component), screens, and widgets

## Dependencies

- flutter_bloc: ^8.1.4 - For state management
- http: ^1.2.0 - For making API requests

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

## API

This app uses the [REST Countries API](https://restcountries.com) with the following endpoints:

- List African countries: `https://restcountries.com/v3.1/region/africa`
- Get country details: `https://restcountries.com/v3.1/name/{name}`

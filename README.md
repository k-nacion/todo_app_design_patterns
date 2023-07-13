# Todo Flutter App

This is a simple Flutter app that allows you to manage your todo list. The app uses the vanilla design pattern, meaning that it only utilizes the `setState` method for state management.

## Features

- Add new tasks to your todo list
- Mark tasks as completed
- Delete tasks from the list
- Edit existing tasks

## Data Source

The data for this app is sourced from a JSON fixture file. It simulates fetching data and parsing it using the `jsonDecode` method. In the future, there are plans to implement local storage (database) to persist the data.

## Inspiration

This project was inspired by [flutter_architecture_samples](https://github.com/brianegan/flutter_architecture_samples.git), a repository showcasing different architecture patterns in Flutter.

## Getting Started

To run the app locally, follow these steps:

1. Clone this repository:
```
git clone https://github.com/k-nacion/todo_app_design_patterns.git
```
2. Navigate to the project directory:
```
cd todo_app_design_patterns
```
3. Install the dependencies:
```
flutter pub get
```
4. Run the app:
```
flutter run
```

## Contributing

Contributions are welcome! If you have any suggestions or find any issues, please feel free to open an issue or submit a pull request.

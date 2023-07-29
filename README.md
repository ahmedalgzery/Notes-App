# Notes App

The Notes App is a simple Flutter application that allows users to create and manage notes. It provides a user-friendly interface for adding, editing, and deleting notes with various customization options. The app utilizes Flutter's state management using the BLoC pattern and utilizes the Hive database for local data storage.

![Notes App Screenshots](/screenshots/screenshot.png)

## Features

- Add a new note with a title and content.
- Edit existing notes to update the title and content.
- Delete notes from the list.
- Customize the background color of each note from a predefined color palette.
- Simple and intuitive user interface.

## Screenshots

![Notes App Screenshot 1](/Screenshot1.png)
![Notes App Screenshot 2](/Screenshot2.png)

## Getting Started

Follow these instructions to set up and run the Notes App locally on your machine.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
- A code editor (e.g., Visual Studio Code, Android Studio) with Flutter and Dart plugins.

### Installation

1. Clone the repository or download the source code.

git clone <https://github.com/ahmedalgzery/Notes-App>

Fetch the dependencies: `flutter pub get`

Run the app: `flutter run`

The Notes App will be launched on your connected device or emulator.

### Dependencies

The app utilizes the following Flutter packages:

`flutter_bloc`: For implementing the BLoC pattern to manage state.
`hive_flutter`: For local data storage using Hive database.
`intl`: For date formatting.
`font_awesome_flutter`: For using FontAwesome icons.
`hive`: For Hive database integration.

### Architecture

The Notes App follows the BLoC (Business Logic Component) pattern for state management. It separates the business logic from the UI and uses Cubits to handle state changes. The data is persisted using Hive, a local NoSQL database.

### Contributing

Contributions to the Notes App are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

### License

The Notes App is open-source software licensed under the MIT License.

### Acknowledgments

The Notes App was inspired by various note-taking apps and Flutter community projects.
Special thanks to all the contributors and the Flutter team for their fantastic work on the Flutter framework

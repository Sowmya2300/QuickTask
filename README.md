# QuickTask

## Project Overview
**QuickTask** is a simple task management app designed to help users organize their tasks efficiently. It is built using **Flutter** for the frontend and **Back4App** as the backend service.

This project demonstrates user authentication and task management functionalities using a clean and simple interface.

---

## Features
1. **User Authentication**:
   - Secure sign-up and login functionality using Back4App.
2. **Task Management**:
   - Add, view, and delete tasks.
   - Mark tasks as completed or incomplete.
3. **Task Details**:
   - Each task includes:
     - Title
     - Due date
     - Completion status

---

## Setup Instructions
Follow these steps to set up the project locally:

### Prerequisites
- Install **Flutter SDK** ([Guide](https://docs.flutter.dev/get-started/install)).
- Install an editor like **Visual Studio Code** or **Android Studio**.
- Ensure you have **Git** installed.
- Create a free account on [Back4App](https://www.back4app.com/) and set up a project.

---

### Steps
1. **Clone the Repository**:
   - Run the following command:
     ```bash
     git clone https://github.com/username/QuickTask.git
     cd QuickTask
     ```

2. **Install Dependencies**:
   - Navigate to the project folder and run:
     ```bash
     flutter pub get
     ```

3. **Set Up Back4App Credentials**:
   - Open `parse_services.dart` and replace the `appId`, `clientKey`, and `serverUrl` with your Back4App credentials.

4. **Run the App**:
   - Connect an Android/iOS emulator or a physical device.
   - Use the following command to launch the app:
     ```bash
     flutter run
     ```

---

## Technologies Used
- **Frontend**: Flutter
- **Backend**: Back4App (Parse Server)
- **Language**: Dart

---

## Contribution
Feel free to fork the repository and submit pull requests to improve this app.

---

## License
This project is licensed under the [MIT License](LICENSE).

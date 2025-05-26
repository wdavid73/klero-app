# Klero App - Task Management Application

## What is it?

Klero App is a modern task management application (Todo App) developed with Flutter. The application allows users to efficiently manage their daily tasks, featuring an intuitive user interface and advanced state management capabilities.

## 🛠️ Technical Stack

### Framework and SDK

- Flutter SDK ^3.32.0
- Dart 3.8.0

### State Management and Architecture

- flutter_bloc ^9.1.1 - For state management
- hydrated_bloc ^10.0.0 - State persistence
- get_it ^8.0.3 - Dependency injection
- go_router ^15.1.2 - Navigation

### Backend and Authentication

- Firebase Authentication
- Cloud Firestore
- Firebase Messaging
- Firebase Remote Config

### UI/UX

- animate_do ^4.2.0 - Animations
- google_fonts ^6.2.1 - Typography
- flutter_svg ^2.1.0 - SVG handling
- shimmer ^3.0.0 - Loading effects

### Storage and Security

- flutter_secure_storage ^9.2.4
- shared_preferences ^2.5.3

### Networking

- dio ^5.8.0+1 - HTTP client

## 🎯 Main Features

1. **User Authentication**

   - User registration
   - Login
   - Firebase authentication

2. **Task Management**

   - Create new tasks
   - Edit existing tasks
   - Delete tasks
   - Mark tasks as completed

3. **Advanced Features**

   - Local and push notifications
   - Real-time synchronization with Firebase
   - Dark/Light mode support
   - Internationalization (i18n) - Multiple language support

4. **UI/UX**

   - Modern and responsive design
   - Fluid animations
   - Customizable themes
   - Intuitive interface

5. **Security**
   - Secure storage of sensitive data
   - Secure token and authentication handling

## 💻 Development Requirements

- Flutter SDK ^3.6.0
- Dart SDK
- Android Studio / VS Code
- Git

## 📦 Installation

1. Clone the repository

```bash
git clone <repository_url>
```

2. Install dependencies

```bash
flutter pub get
```

3. Configure Firebase

   - Add the `google-services.json` file for Android
   - Configure Firebase in the Firebase console

4. Run the application

```bash
flutter run
```

## 📚 Documentation

For more information about the architecture and application functionality, check the [detailed documentation](docs/README.md).

## 👨‍💻 Contributing

If you want to contribute to the project, please:

1. Fork the repository
2. Create a branch for your feature (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 💬 Support

If you have any questions or suggestions, feel free to:

- Open an issue
- Contact the development team
- Check the documentation

## 🔒 License

This project is under the MIT License - see the [LICENSE](LICENSE) file for details.

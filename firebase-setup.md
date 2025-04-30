# Firebase Setup in a Flutter Project

This document describes the steps to integrate Firebase into a Flutter project using **FlutterFire**.

## Prerequisites

1. Have [Flutter](https://flutter.dev/docs/get-started/install) installed. 
2. Have a [Firebase](https://firebase.google.com/) account. 
3. Install the latest version of the Firebase CLI (Run in the terminal).
    ```sh
    npm install -g firebase-tools
    ```
4. Log in to Firebase (Run in the terminal).
   ```sh
   firebase login
    ```

## Option 1: Manual Configuration

### 1. Create a Project in Firebase

1.  Go to [Firebase Console](https://console.firebase.google.com/).
2.  Create a new project and follow the instructions.
3.  In the **Project settings** section, select **Add app** and choose the appropriate platform (iOS/Android).

### 2. Configure Firebase on Android

1. In Firebase Console, add a new Android application. 
2. Enter the **package name** (found in `android/app/src/main/AndroidManifest.xml`). 
3. Download the `google-services.json` file and place it in `android/app/`. 
4. Add dependencies in `android/build.gradle` (Modify file).
    ```gradle
   dependencies {
       classpath 'com.google.gms:google-services:4.3.10'
   }
    ```
5. Apply the Google Services plugin in `android/app/build.gradle` (Modify file).
   ```gradle
   apply plugin: 'com.google.gms.google-services'
    ```

### 3. Configure Firebase on iOS

1. In Firebase Console, add a new iOS application. 
2. Enter the **Bundle ID** (found in `ios/Runner.xcodeproj`). 
3. Download the `GoogleService-Info.plist` file and place it in `ios/Runner/`.
    ```sh
    cd ios
    pod install
    ```
4. Install CocoaPods dependencies (Run in the terminal). 
5. Ensure that `ios/Runner/Info.plist` contains the required security configuration (Modify file).
    ```xml
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>
    ```

### 4. Install FlutterFire in Flutter

1. Add Firebase Core as a dependency (Run in the terminal).
    ```sh
   flutter pub add firebase_core
    ```
2. (Optional) Add other services like Authentication or Firestore (Run in the terminal).
    ```sh
   flutter pub add firebase_auth
   flutter pub add cloud_firestore
    ```

### 5. Initialize Firebase in Flutter

1. Modify `main.dart` to initialize Firebase at the start of the application (Modify file).
    ```dart
        import 'package:flutter/material.dart';
        import 'package:firebase_core/firebase_core.dart';
        
        void main() async {
            WidgetsFlutterBinding.ensureInitialized();
            await Firebase.initializeApp();
            runApp(MyApp());
        }
        
        class MyApp extends StatelessWidget {
            @override
            Widget build(BuildContext context) {
                return MaterialApp(
                    home: Scaffold(
                    appBar: AppBar(title: Text("Firebase Configurado")),
                    body: Center(child: Text("¡Firebase está listo!")),
                ),
            );
        }
    }
    ```

### 6. Verify the Installation

1. Run the application to check the configuration (Run in the terminal).
    ```sh
   flutter run
    ```

---

## Option 2: Automatic Configuration with `flutterfire_cli`

FlutterFire CLI allows you to configure Firebase in a single command.

### 1. Install `flutterfire_cli`

1. Activate FlutterFire CLI (Run in the terminal).
    ```sh
   dart pub global activate flutterfire_cli
    ```
   ```sh
   fvm dart pub global activate flutterfire_cli
    ```
2. Ensure that the executable is in the `PATH` (Run in the terminal).
    ```sh
   export PATH="$PATH:$HOME/.pub-cache/bin"
   ```

### 2. Log in to Firebase

1. Log in to Firebase (Run in the terminal).
    ```sh
    firebase login
    ```

### 3. Configure Firebase in the Flutter Project

1. Run the automatic configuration (Run in the terminal). 
2. Select the Firebase project from the interactive list. 
3. Select the platforms to configure (Android/iOS/Web).
    ```sh
   flutterfire configure
   ```
    ```sh
   fvm dart pub global run flutterfire_cli:flutterfire configure
   ```
4. Verify that the `firebase_options.dart` file was generated correctly in `lib/

### 4. Initialize Firebase in `main.dart`

1. Modify `main.dart` to initialize Firebase at the start of the application (Modify file).
    ```dart
        import 'package:flutter/material.dart';
        import 'package:firebase_core/firebase_core.dart';
        import 'firebase_options.dart';
        
        void main() async {
            WidgetsFlutterBinding.ensureInitialized();
            await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
            runApp(MyApp());
        }
        
        class MyApp extends StatelessWidget {
            @override
            Widget build(BuildContext context) {
                return MaterialApp(
                    home: Scaffold(
                    appBar: AppBar(title: Text("Firebase Configurado")),
                    body: Center(child: Text("¡Firebase está listo!")),
                ),
            );
        }
    }
    ```

### 5. Verify the Configuration

1. Run the application to confirm the integration (Run in the terminal).
    ```sh
   flutter run
    ```
---

## Additional Resources

-   [Official FlutterFire Documentation](https://firebase.flutter.dev/)
-   [Firebase Documentation](https://firebase.google.com/docs)
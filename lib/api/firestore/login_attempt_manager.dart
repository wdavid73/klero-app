/* import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseOperationFailedException implements Exception {
  final String message;
  final dynamic error;

  FirebaseOperationFailedException(this.message, [this.error]);

  @override
  String toString() {
    return "FirebaseOperationFailedException: $message${error != null ? '(Original Error: $error)' : ''}";
  }
}

class FailedToRecordLoginAttemptException implements Exception {
  final dynamic originalError;
  final String message =
      "Error al registrar el intento de inicio de sesión fallido";

  FailedToRecordLoginAttemptException([this.originalError]);

  @override
  String toString() {
    return '$message${originalError != null ? ' (Original Error: $originalError)' : ''}';
  }
}

/// Manages login attempt logic, including lockout for failed attempts.
class LoginAttemptManager {
  /// Instance of FirebaseFirestore to interact with the database.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Maximum number of failed attempts allowed before lockout.
  final int maxAttempts = 3;

  /// Lockout duration after reaching the maximum number of failed attempts.
  final Duration lockoutDuration = Duration(hours: 1);

  /// Name of the collection in Firestore where login attempts are stored.
  final String collectionName = "login_attempts";

  /// Checks if a user can attempt to log in based on the number of failed attempts and lockout time.
  ///
  /// Takes the user's [email] as a parameter.
  /// Returns `true` if the user can attempt to log in, `false` if the account is locked out.
  Future<bool> canAttemptLogin(String email) async {
    try {
      // Gets the user's document in the login attempts collection.
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection(collectionName).doc(email).get();

      // If the document exists, checks the attempts and lockout time.
      if (snapshot.exists) {
        final data = snapshot.data()!;

        // Gets the number of attempts, or 0 if it doesn't exist.
        int attempts = data['attempts'] ?? 0;

        // Gets the last attempt timestamp.
        Timestamp? lastAttempt = data['last_attempt'] as Timestamp?;

        // If the maximum attempts have been reached or exceeded and there is a last attempt record.
        if (attempts >= maxAttempts && lastAttempt != null) {
          DateTime lockoutEndTime = lastAttempt.toDate().add(lockoutDuration);
          // If the current time is before the lockout end time, the account is locked out.
          if (DateTime.now().isBefore(lockoutEndTime)) {
            return false; // Account locked out.
          } else {
            // The lockout time has expired, reset the attempts counter.
            await _resetAttempts(email);
            return true;
          }
        }
      }
      return true; // No attempt record or the limit has not been reached.
    } catch (e) {
      // In case of an error during verification, return true to allow the attempt
      // (the login logic should handle potential connection errors).
      throw FirebaseOperationFailedException(
        "error verify attempts to log in",
        e,
      );
    }
  }

  /// Records a failed login attempt for the specified user.
  ///
  /// Takes the user's [email] as a parameter.
  Future<void> recordFailedAttempt(String email) async {
    try {
      // Gets the reference to the user's document.
      DocumentReference userRef =
          _firestore.collection(collectionName).doc(email);
      DocumentSnapshot snapshot = await userRef.get();

      // If the document exists, increment the attempts counter and update the last attempt timestamp.
      if (snapshot.exists) {
        await userRef.update({
          'attempts': FieldValue.increment(1),
          'last_attempt': Timestamp.now(),
        });
      } else {
        // If the document does not exist, create a new one with the first failed attempt.
        await userRef.set({
          'attempts': 1,
          'last_attempt': Timestamp.now(),
        });
      }
    } catch (e) {
      // Consider returning a Future<bool> here if you need to know if the operation was successful.
      throw FirebaseOperationFailedException(
        "Error register attempts of log in failed",
        e,
      );
    }
  }

  /// Resets the login attempt counter for the specified user.
  ///
  /// Takes the user's [email] as a parameter.
  Future<void> resetAttempts(String email) async {
    await _resetAttempts(email);
  }

  /// Private function to reset a user's login attempts by deleting their document.
  ///
  /// Takes the user's [email] as a parameter.
  Future<bool> _resetAttempts(String email) async {
    try {
      await _firestore.collection(collectionName).doc(email).delete();
      return true; // Indicates that the reset was successful.
    } catch (e) {
      // Indicates that there was an error during the reset.
      throw FirebaseOperationFailedException('Error reset attempts', e);
    }
  }
}
 */

import 'en_form_validation.dart';
import 'en_form_texts.dart';
import 'en_introduction.dart';

Map<String, String> enBase = {
  'name': 'Name',
  'email': 'Email',
  'email_address': 'Email Address',
  'home': 'Home',
  // AUTH
  'sign_in_account': 'Sign in to your account',
  'login': 'Login',
  'sign_up': 'Sign up',
  'logout': 'Log Out',
  'not_have_account': "Don't have an account?",
  'create_one_here': "create one here",
  'password': 'Password',
  'confirm_password': 'Confirm Password',
  'new_password': 'New Password',
  'forget_password': 'Forget Password?',
  "recovery_password": 'Password Recovery',
  "sign_in_failed": "Sign In Failed",
  "confirm_email": "Confirm Email",
  "confirm_email_msg":
      "Please enter your email address to verify it exists and continue with the password reset process.",
  "password_update": "Password Updated Successfully",
  'sign_in_with_google': 'Sign in with Google',
  'sign_in_with_apple': 'Sign in with Apple ID',
  "accept__btn": "Accept",
  "cancel__btn": "Cancel",
  // NOT FOUND
  'its_empty': 'Oops! It’s Empty',
  'not_found_title': 'Not found',
  'not_found_info': 'We could not find what you were looking for',
  // DRAWER
  'profile': 'Profile',
  'settings': 'Settings',
  // SETTING PAGE
  'report_bug': 'Report a bug',
  'send_feedback': 'Send a feedback',
  'account': 'Account',
  'delete_account': 'Delete account',
  'feedback': 'Feedback',
  'theme': 'Theme',
  'dark_theme': 'Dark Theme',
  'general': 'General',
  // GENERAL
  'error': 'Error!',
  'loading': 'Loading...',
  'not_found_item': 'No items found!',
  'save': 'Save',
  'update': 'Update',
  'delete': 'Delete',
  'close': 'Close',
  'open': 'Open',
  'register_success': 'Register Successfully',
  'register_error': 'An error occurred during registration!',
  'not_user': 'Not User',
  'end_list': 'You have reached the end of the list.',
  'image_not_found': 'Image not found.',
  // * NETWORK ERRORS
  'connection_time_out':
      'The connection request took a long time and was aborted.',
  'send_time_out': 'The connection request took a long time and was aborted.',
  'receive_time_out': 'The connection has timed out, please try again.',
  'bad_response':
      'Response with a non-standard status code, possibly due to server software. ',
  'connection_error': 'The connection error.',
  'bad_certificate': 'Bad certificate',
  'unknown': 'An unknown error occurred processing the request.',
  'cancel': 'The request was manually cancelled by the user.',
  'not_internet': 'No internet connection detected, please try again.',
  'error_get_image': 'Error getting image.',
};

Map<String, String> enMap = {
  ...enBase,
  ...formValidations,
  ...formTexts,
  ...introduction,
};

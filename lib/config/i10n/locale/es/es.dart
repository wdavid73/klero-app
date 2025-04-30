import 'es_form_validation.dart';

Map<String, String> esBase = {
  'name': 'Nombre',
  'email': 'Correo',
  'email_address': 'Correo electrónico',
  'home': 'Inicio',
  // AUTH
  'sign_in_account': 'Acceda a su cuenta',
  'login': 'Iniciar Sesión',
  'sign_up': 'Regístrate',
  'logout': 'Cerrar Sesión',
  'not_have_account': "¿No tienes cuenta?",
  'create_one_here': "Crea una aquí",
  'password': 'Contraseña',
  'new_password': 'Nueva Contraseña',
  'confirm_password': 'Confirmar contraseña',
  'forget_password': '¿Olvidaste tu contraseña?',
  "recovery_password": 'Recuperar contraseña',
  "sign_in_failed": "Inicio de sesión fallido",
  "confirm_email": "Confirmar Email",
  "confirm_email_msg":
      "Por favor ingrese su correo electrónico, para verificar que existe y seguir con su proceso de restablecimiento de contraseña",
  "password_update": "Contraseña actualizada correctamente",
  'sign_in_with_google': 'Iniciar sesión con Google',
  'sign_in_with_apple': 'Iniciar sesión con ID de Apple',
  "accept__btn": "Aceptar",
  "cancel__btn": "Cancelar",
  // FOUND
  'its_empty': '¡Uy! Está vacío',
  'not_found_title': 'No encontrado',
  'not_found_info': 'No pudimos encontrar lo que buscabas',
  // DRAWER
  'profile': 'Perfil',
  'settings': 'Configuración',
  // SETTING PAGE
  'report_bug': 'Reportar un error',
  'send_feedback': 'Enviar feedback',
  'account': 'Cuenta',
  'delete_account': 'Borrar cuenta',
  'feedback': 'Feedback',
  'theme': 'Tema',
  'dark_theme': 'Tema oscuro',
  'general': 'General',

  /// GENERAL
  'error': '¡Error!',
  'loading': 'Cargando...',
  'not_found_item': '¡No se han encontrado elementos!',
  'save': 'Guardar',
  'update': 'Actualizar',
  'delete': 'Eliminar',
  'close': 'Cerrar',
  'open': 'Abrir',
  'register_success': 'Registro satisfactorio',
  'register_error': 'Se ha producido un error durante el registro',
  'not_user': 'Sin usuario',
  'connection_time_out':
      'La solicitud de conexión tardó mucho tiempo y fue abortada.',
  'send_time_out':
      'La solicitud de conexión tardó mucho tiempo y fue abortada.',
  'receive_time_out': 'La conexión se ha interrumpido, inténtelo de nuevo.',
  'connection_error': 'Error de conexión.',
  'bad_certificate': 'Mal certificado',
  'bad_response':
      'Respuesta con un código de estado no estándar, posiblemente debido al software del servidor. ',
  'unknown': 'Se ha producido un error desconocido al procesar la solicitud.',
  'cancel': 'La solicitud ha sido cancelada manualmente por el usuario.',
  'not_internet': 'No se ha detectado conexión a Internet, inténtelo de nuevo.',
  'image_not_found': 'Imagen no encontrada',
  'error_get_image': 'Error obteniendo la imagen.',
  'end_list': 'Has llegado al final de la lista.'
};

Map<String, String> esMap = {
  ...esBase,
  ...formValidations,
};
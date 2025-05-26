# Klero App - Aplicación de Gestión de Tareas

## ¿Qué es?

Klero App es una aplicación moderna de gestión de tareas (Todo App) desarrollada con Flutter. La aplicación permite a los usuarios gestionar sus tareas diarias de manera eficiente, con una interfaz de usuario intuitiva y características avanzadas de gestión de estado.

## 🛠️ Stack Tecnológico

### Framework y SDK

- Flutter SDK ^3.32.0
- Dart 3.8.0

### Gestión de Estado y Arquitectura

- flutter_bloc ^9.1.1 - Para la gestión de estado
- hydrated_bloc ^10.0.0 - Persistencia de estado
- get_it ^8.0.3 - Inyección de dependencias
- go_router ^15.1.2 - Navegación

### Backend y Autenticación

- Firebase Authentication
- Cloud Firestore
- Firebase Messaging
- Firebase Remote Config

### UI/UX

- animate_do ^4.2.0 - Animaciones
- google_fonts ^6.2.1 - Tipografía
- flutter_svg ^2.1.0 - Manejo de SVGs
- shimmer ^3.0.0 - Efectos de carga

### Almacenamiento y Seguridad

- flutter_secure_storage ^9.2.4
- shared_preferences ^2.5.3

### Networking

- dio ^5.8.0+1 - Cliente HTTP

## 🎯 Funcionalidades Principales

1. **Autenticación de Usuarios**

   - Registro de usuarios
   - Inicio de sesión
   - Autenticación con Firebase

2. **Gestión de Tareas**

   - Crear nuevas tareas
   - Editar tareas existentes
   - Eliminar tareas
   - Marcar tareas como completadas

3. **Características Avanzadas**

   - Notificaciones locales y push
   - Sincronización en tiempo real con Firebase
   - Soporte para modo oscuro/claro
   - Internacionalización (i18n) - Soporte para múltiples idiomas

4. **UI/UX**

   - Diseño moderno y responsivo
   - Animaciones fluidas
   - Temas personalizables
   - Interfaz intuitiva

5. **Seguridad**
   - Almacenamiento seguro de datos sensibles
   - Manejo seguro de tokens y autenticación

## 💻 Requisitos de Desarrollo

- Flutter SDK ^3.32.0
- Dart SDK
- Android Studio / VS Code
- Git

## 📦 Instalación

1. Clonar el repositorio

```bash
git clone <repository_url>
```

2. Instalar dependencias

```bash
flutter pub get
```

3. Configurar Firebase

   - Agregar el archivo `google-services.json` para Android
   - Configurar Firebase en la consola de Firebase

4. Ejecutar la aplicación

```bash
flutter run
```

## 📚 Documentación

Para más información sobre la arquitectura y el funcionamiento de la aplicación, consulta la [documentación detallada](docs/README.md).

## 👨‍💻 Contribución

Si deseas contribuir al proyecto, por favor:

1. Haz un Fork del repositorio
2. Crea una rama para tu funcionalidad (`git checkout -b feature/AmazingFeature`)
3. Haz commit de tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 💬 Soporte

Si tienes alguna pregunta o sugerencia, no dudes en:

- Abrir un issue
- Contactar al equipo de desarrollo
- Consultar la documentación

## 🔒 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
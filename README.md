# ChatSwiftUi

# Documentación del Proyecto Chat SwiftUI con Firebase

## Requisitos Iniciales

- La aplicación debe permitir a los usuarios iniciar sesión con su cuenta de correo electrónico y contraseña.
- Los usuarios deben poder ver una lista de conversaciones a las que están suscritos.
- Al seleccionar una conversación, los usuarios deben poder ver todos los mensajes de la conversación y enviar nuevos mensajes.
- Los usuarios deben poder ver su perfil y actualizar su nombre de usuario y foto de perfil.
- Todos los datos de usuario, conversación y mensaje deben ser almacenados en Firebase Firestore.
- Debe haber un sistema de autenticación y autorización para garantizar que los usuarios solo puedan acceder a las conversaciones a las que tienen acceso.
- La aplicación debe seguir los principios de Clean Architecture, con separación de responsabilidades en capas, tales como Domain, Data, y Presentation.

---

## Funcionalidades implementadas

### 1. Autenticación con Firebase

- Registro de usuarios con correo electrónico y contraseña.
- Inicio de sesión con validación.
- Manejo de usuarios sin nombre (displayName), mostrando en la UI el `userId` cuando no se tiene un nombre.
- Manejo de errores en autenticación.

### 2. Chat y Mensajería

- Visualización de mensajes en tiempo real en la conversación.
- Distinción visual clara entre mensajes enviados y recibidos:
  - Mensajes propios a la derecha con fondo verde.
  - Mensajes de otros usuarios a la izquierda con fondo gris.
- Se muestra el `userId` del remitente arriba de cada mensaje, o el nombre si está disponible.
- Campo para enviar mensajes nuevos y refresco inmediato del chat.

### 3. Arquitectura

- Uso de MVVM para separar lógica de negocio (`ChatViewModel`, `LoginViewModel`) de la UI (`HomeView`).
- Separación clara entre presentación y lógica de datos.
- Se usaron extensiones para mejorar la UI, como redondear esquinas específicas de los mensajes.

### 4. Firebase Firestore

- Configuración e integración con Firestore para almacenamiento de usuarios y mensajes.
- Uso de reglas de seguridad básicas en modo debug para pruebas locales.
- Observación en tiempo real de cambios en la colección de mensajes para actualizar UI.

---

## Mejoras adicionales realizadas

- Manejo condicional de datos opcionales para evitar mostrar textos vacíos en la interfaz.
- Personalización de los componentes visuales para mejorar la experiencia del usuario.
- Optimización del envío de mensajes para resetear el campo de texto y evitar envíos vacíos.
- Adaptación del diseño para que el chat sea usable en diferentes tamaños de pantalla.
- Documentación del código para facilitar futuras modificaciones y mantenimiento.

---

## Próximos pasos recomendados

- Implementar lista de conversaciones y navegación entre ellas.
- Agregar perfil de usuario editable (nombre y foto).
- Mejorar reglas de seguridad y autenticación para producción.
- Añadir pruebas unitarias y de UI para asegurar calidad.
- Refinar la arquitectura para cumplir completamente con Clean Architecture, creando capas Domain y Data más definidas.

---

## Conclusión

En este reto de 4 horas, se logró construir una base sólida para una aplicación de chat con Firebase y SwiftUI, que incluye autenticación, visualización y envío de mensajes en tiempo real, y un diseño UI funcional y claro. El proyecto está preparado para escalar con funcionalidades adicionales y mejorar la arquitectura.

---

*Creado por Mario Saldana - 27/05/2025*

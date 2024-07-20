# Proyecto Flutter

Este es un proyecto de prueba para una entrevista tecnica. Seguir estos pasos para descargar, instalar las dependencias y probar la aplicación en un teléfono Android o iOS.

## Requisitos Previos

- Tener [Flutter](https://flutter.dev/docs/get-started/install) instalado en tu máquina, version requerida para este proyecto 3.0.0.
- Tener [Xcode](https://developer.apple.com/xcode/) instalado si deseas probar en iOS.
- Tener [Android Studio](https://developer.android.com/studio) o [Visual Studio Code](https://code.visualstudio.com/) con los plugins de Flutter y Dart instalados.

## 1. Descargar el Proyecto

1. Abre una terminal o línea de comandos.
2. Clona el repositorio con el siguiente comando:

    ```bash
    git clone https://github.com/lrlucas/bookapp.git
    ```

3. Navega al directorio del proyecto:

    ```bash
    cd bookapp
    ```

## 2. Instalar Dependencias

1. Asegúrate de estar en el directorio raíz del proyecto.
2. Ejecuta el siguiente comando para instalar las dependencias del proyecto:

    ```bash
    flutter pub get
    ```

## 3. Probar en un Dispositivo Android

1. Conecta tu dispositivo Android al ordenador o asegúrate de que un emulador esté en funcionamiento.
2. En la terminal, ejecuta el siguiente comando para lanzar la aplicación:

    ```bash
    flutter run
    ```

## 4. Probar en un Dispositivo iOS

1. Asegúrate de que tu dispositivo iOS esté conectado o que un simulador esté en funcionamiento.
2. Abre el proyecto en Xcode:

    ```bash
    open ios/Runner.xcworkspace
    ```

3. En Xcode, selecciona tu dispositivo o simulador en el menú superior y haz clic en el botón de reproducción para construir y ejecutar la aplicación.

## Problemas Comunes

- **Error al ejecutar `flutter pub get`**: Aegurarse que la versión de Flutter esté en lo minimo requerido 3.0.0 y que este en el directorio correcto del proyecto.
- **Problemas con el dispositivo Android/iOS**: Verifica que los drivers estén instalados y que los dispositivos estén correctamente conectados.



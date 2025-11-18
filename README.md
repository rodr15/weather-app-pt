# ☁️ Aplicación del Clima (weather_app_pt)

Esta es una aplicación Flutter moderna y responsiva diseñada para proporcionar información meteorológica en tiempo real y pronósticos utilizando la API de Visual Crossing Weather. La aplicación utiliza Realm para la persistencia de datos local y Riverpod para la gestión de estados, los cuales requieren generación de código.

# 🚀 Cómo Ejecutar el Proyecto

Sigue estos pasos para poner la aplicación en funcionamiento en tu máquina local.

## 1. Prerrequisitos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- Flutter SDK: Versión 3.0 o superior.
- Dart SDK: Versión 3.0 o superior.
- Una Clave API de Visual Crossing: Debes obtener una clave API gratuita o de pago desde el sitio web de Visual Crossing.

## 2. Configuración de Dependencias

El proyecto utiliza varios paquetes, incluyendo aquellos que requieren generación de código.

Primero, ejecuta flutter pub get para obtener todos los paquetes necesarios:

```bash
flutter pub get
```

## 3. Configuración de la Clave API

La aplicación requiere una clave API para obtener datos meteorológicos. La clave se gestiona utilizando un archivo local .env por motivos de seguridad.

- Crea un archivo llamado `.env` en el directorio raíz del proyecto (junto a pubspec.yaml).
- Añade tu Clave API de Visual Crossing al archivo usando el siguiente formato:
  `VISUALCROSSINGAPIKEY=YOUR_API_KEY_HERE`

Ejemplo: `VISUALCROSSINGAPIKEY=ASDFASDFASDF`.

## 4. Generación de Código (`build_runner` y Localización)

Dado que este proyecto utiliza localización (l10n) y Riverpod Generator para la gestión de estados, debes ejecutar los generadores de código en el orden correcto.

- Generación de LocalizaciónSi el proyecto utiliza archivos .arb para la localización, ejecuta el siguiente comando para generar las clases AppLocalizations:flutter gen-l10n

- Generación de Modelos y ProvidersLuego, ejecuta el siguiente comando para crear los archivos .g.dart necesarios. El flag --delete-conflicting-outputs asegura que cualquier archivo generado antiguo o incorrecto se limpie automáticamente.

```bash
dart run build_runner build --delete-conflicting-outputs
```

Alternativamente, para la generación continua durante el desarrollo (recomendado):

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### 5. Iniciar la Aplicación (con Flavors)

Dado que el proyecto utiliza flavors (dev y prod); una vez que todos los paquetes estén instalados y la generación de código esté completa, ejecuta el comando apropiado para el flavor que deseas:

Para ejecutar el flavor de Desarrollo (dev):

```bash
flutter run --flavor dev
```

Para ejecutar el flavor de Producción (prod):

```bash
flutter run --flavor prod
```

## 🛠️ Tecnologías

- **ClaveGestión de Estados**: Riverpod
- **Localización**: flutter gen-l10n
- **Generación de Código**: build_runner,riverpod_generator
- **API**: Visual Crossing Weather API

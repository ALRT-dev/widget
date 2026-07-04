import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

// Google Maps API key — injected into the manifest at build time, never committed.
// Resolved from (in order): the GOOGLE_MAPS_API_KEY environment variable (CI), then the
// project's .env file (the same file flutter_dotenv loads at runtime).
val mapsApiKey: String = run {
    System.getenv("GOOGLE_MAPS_API_KEY")?.takeIf { it.isNotBlank() }?.let { return@run it }
    val envFile = rootProject.file("../.env")
    if (envFile.exists()) {
        val envProps = Properties()
        envFile.inputStream().use { envProps.load(it) }
        (envProps.getProperty("GOOGLE_MAPS_API_KEY"))?.takeIf { it.isNotBlank() }?.let { return@run it }
    }
    ""
}

android {
    namespace = "com.safetyalrt.alrt"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.safetyalrt.alrt"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // Substituted into com.google.android.geo.API_KEY in AndroidManifest.xml.
        manifestPlaceholders["MAPS_API_KEY"] = mapsApiKey
    }

    // Release signing uses key.properties when present; otherwise the build
    // falls back to debug signing so local `flutter run --release` and CI
    // builds without the keystore still work.
    val hasReleaseKeystore = keystorePropertiesFile.exists()
    signingConfigs {
        if (hasReleaseKeystore) {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = keystoreProperties["storeFile"]?.let { file(it) }
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        debug {
            signingConfig = signingConfigs.getByName("debug")
        }
        release {
            signingConfig = if (hasReleaseKeystore) {
                signingConfigs.getByName("release")
            } else {
                logger.warn(
                    "key.properties not found — signing release build with debug keys."
                )
                signingConfigs.getByName("debug")
            }
        }
    }

    flavorDimensions += "default"
    productFlavors {
        create("dev") {
            dimension = "default"
            resValue("string", "app_name", "[Dev] ALRT")
            applicationIdSuffix = ".dev"
        }
        create("prod") {
            dimension = "default"
            resValue("string", "app_name", "ALRT")
            applicationIdSuffix = ""
        }
    }
}

flutter {
    source = "../.."
}

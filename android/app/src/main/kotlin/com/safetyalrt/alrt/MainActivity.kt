package com.safetyalrt.alrt

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Intent
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private companion object {
        const val CHANNEL = "com.safetyalrt.alrt/widget_pinning"
        const val EXTRA_PIN_WIDGET = "pin_widget"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "isPinSupported" -> result.success(isPinSupported())
                    "requestPinWidget" -> {
                        val kind = call.argument<String>("widget") ?: "alerts"
                        result.success(requestPinWidget(kind))
                    }
                    else -> result.notImplemented()
                }
            }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        handlePinExtra(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        handlePinExtra(intent)
    }

    /** App-icon shortcut taps land here with a pin_widget extra. */
    private fun handlePinExtra(intent: Intent?) {
        val kind = intent?.getStringExtra(EXTRA_PIN_WIDGET) ?: return
        intent.removeExtra(EXTRA_PIN_WIDGET)
        requestPinWidget(kind)
    }

    private fun isPinSupported(): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return false
        return try {
            AppWidgetManager.getInstance(this).isRequestPinAppWidgetSupported
        } catch (e: Exception) {
            false
        }
    }

    /** Shows the launcher's pin-widget dialog; returns whether it was shown. */
    private fun requestPinWidget(kind: String): Boolean {
        if (!isPinSupported()) return false
        val providerClass = when (kind) {
            "family" -> AlrtFamilyWidgetProvider::class.java
            else -> AlrtAlertsWidgetProvider::class.java
        }
        return try {
            AppWidgetManager.getInstance(this).requestPinAppWidget(
                ComponentName(this, providerClass),
                null,
                null as PendingIntent?,
            )
        } catch (e: Exception) {
            false
        }
    }
}

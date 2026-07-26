package com.safetyalrt.alrt

import android.appwidget.AppWidgetManager
import android.content.Context
import android.net.Uri
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider
import org.json.JSONObject

/**
 * ALRT "Nearby Alerts" home-screen widget.
 *
 * Renders the single JSON payload written by the Flutter side
 * (`HomeWidgetKeys.payloadKey`). Honors the locked product rules:
 *  - the solid red gradient card is used ONLY for the `critical` band
 *    ("the two reds", rule 6);
 *  - severity always shows emoji + text label, never colour alone (rule 8);
 *  - tapping opens the app (never fires SOS directly, rule 3).
 */
class AlrtAlertsWidgetProvider : HomeWidgetProvider() {

    companion object {
        private const val PAYLOAD_KEY = "alrt_widget_payload"
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: android.content.SharedPreferences
    ) {
        for (widgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.alrt_widget)
            val raw = widgetData.getString(PAYLOAD_KEY, null)

            val payload = raw?.let {
                runCatching { JSONObject(it) }.getOrNull()
            }

            if (payload == null) {
                renderAllClear(views, "")
            } else {
                bind(views, payload)
            }

            // Tap anywhere → open the app at the payload's deeplink.
            val deeplink = payload?.optString("deeplink")
                ?.takeIf { it.isNotBlank() }
                ?: "alrtwidget://open?screen=alerts"
            val pendingIntent = HomeWidgetLaunchIntent.getActivity(
                context,
                MainActivity::class.java,
                Uri.parse(deeplink)
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }

    private fun bind(views: RemoteViews, payload: JSONObject) {
        val updated = payload.optString("updatedLabel", "")
        views.setTextViewText(R.id.widget_updated, updated)

        val state = payload.optString("state", "all_clear")
        if (state != "alert" || !payload.has("primary")) {
            renderAllClear(views, updated)
            return
        }

        // Show the alert block, hide the all-clear block.
        views.setViewVisibility(R.id.widget_alert_block, android.view.View.VISIBLE)
        views.setViewVisibility(R.id.widget_allclear_block, android.view.View.GONE)

        val primary = payload.getJSONObject("primary")
        val band = primary.optString("band", "info")
        val severityLabel = primary.optString("severityLabel", "")
        val title = primary.optString("title", "")
        val emoji = primary.optString("emoji", "")

        views.setTextViewText(R.id.widget_emoji, emoji)
        views.setTextViewText(R.id.widget_title, title)
        views.setTextViewText(R.id.widget_chip, severityLabel.uppercase())

        // Meta line: area · distance · time (only the parts we have).
        val meta = listOfNotNull(
            primary.optString("area").ifBlank { null },
            primary.optString("distance").ifBlank { null },
            primary.optString("time").ifBlank { null }
        ).joinToString("  ·  ")
        views.setTextViewText(R.id.widget_meta, meta)

        val isCritical = band == "critical"

        // "The two reds": solid red gradient card for critical only.
        views.setInt(
            R.id.widget_root,
            "setBackgroundResource",
            if (isCritical) R.drawable.alrt_widget_bg_critical else R.drawable.alrt_widget_bg
        )

        // Chip + text colours per band.
        when {
            isCritical -> {
                views.setInt(R.id.widget_chip, "setBackgroundResource", R.drawable.alrt_widget_chip_white)
                views.setTextColor(R.id.widget_chip, 0xFFCC1010.toInt())
                views.setTextColor(R.id.widget_title, 0xFFFFFFFF.toInt())
                views.setTextColor(R.id.widget_meta, 0xFFFFE3E0.toInt())
                views.setTextColor(R.id.widget_kicker, 0xFFFFD9D5.toInt())
                views.setTextColor(R.id.widget_updated, 0xFFFFD9D5.toInt())
            }
            band == "action" -> {
                views.setInt(R.id.widget_chip, "setBackgroundResource", R.drawable.alrt_widget_chip_orange)
                views.setTextColor(R.id.widget_chip, 0xFFFFFFFF.toInt())
                resetDarkCardText(views)
            }
            else -> {
                // info / monitor / advice → amber chip, dark text on chip.
                views.setInt(R.id.widget_chip, "setBackgroundResource", R.drawable.alrt_widget_chip_amber)
                views.setTextColor(R.id.widget_chip, 0xFF1A1B1F.toInt())
                resetDarkCardText(views)
            }
        }

        // "+N more nearby" affordance.
        val more = payload.optJSONArray("more")
        val extra = more?.length() ?: 0
        if (extra > 0) {
            val label = if (extra == 1) "+1 more nearby" else "+$extra more nearby"
            views.setTextViewText(R.id.widget_more, label)
            views.setViewVisibility(R.id.widget_more, android.view.View.VISIBLE)
        } else {
            views.setViewVisibility(R.id.widget_more, android.view.View.GONE)
        }
    }

    private fun resetDarkCardText(views: RemoteViews) {
        views.setTextColor(R.id.widget_title, 0xFFFFFFFF.toInt())
        views.setTextColor(R.id.widget_meta, 0xFFC9C9D2.toInt())
        views.setTextColor(R.id.widget_kicker, 0xFFB7B7C0.toInt())
        views.setTextColor(R.id.widget_updated, 0xFF8B8B95.toInt())
        views.setTextColor(R.id.widget_more, 0xFFB7B7C0.toInt())
    }

    private fun renderAllClear(views: RemoteViews, updated: String) {
        views.setInt(R.id.widget_root, "setBackgroundResource", R.drawable.alrt_widget_bg)
        views.setViewVisibility(R.id.widget_alert_block, android.view.View.GONE)
        views.setViewVisibility(R.id.widget_allclear_block, android.view.View.VISIBLE)
        resetDarkCardText(views)
        views.setTextViewText(R.id.widget_updated, updated)
    }
}

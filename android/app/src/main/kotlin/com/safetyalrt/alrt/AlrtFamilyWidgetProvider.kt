package com.safetyalrt.alrt

import android.appwidget.AppWidgetManager
import android.content.Context
import android.net.Uri
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider
import org.json.JSONObject

/**
 * ALRT Family status home-screen widget.
 *
 * Shows one headline + sub-line for the user's circle. The solid red card is
 * used ONLY for a live family SOS (rule 6). A tap opens the app (SOS receiver
 * for an active SOS, otherwise the Family tab) and never triggers or resolves
 * an SOS (rule 3).
 */
class AlrtFamilyWidgetProvider : HomeWidgetProvider() {

    companion object {
        private const val PAYLOAD_KEY = "alrt_family_widget_payload"
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: android.content.SharedPreferences
    ) {
        for (widgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.alrt_family_widget)
            val payload = widgetData.getString(PAYLOAD_KEY, null)
                ?.let { runCatching { JSONObject(it) }.getOrNull() }

            if (payload == null) {
                views.setTextViewText(R.id.family_kicker, "FAMILY")
                views.setTextViewText(R.id.family_headline, "No family circle")
                views.setTextViewText(R.id.family_sub, "Set up in the app")
            } else {
                bind(views, payload)
            }

            val deeplink = payload?.optString("deeplink")
                ?.takeIf { it.isNotBlank() }
                ?: "alrtwidget://open?screen=family"
            views.setOnClickPendingIntent(
                R.id.family_root,
                HomeWidgetLaunchIntent.getActivity(
                    context, MainActivity::class.java, Uri.parse(deeplink)
                )
            )

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }

    private fun bind(views: RemoteViews, payload: JSONObject) {
        val state = payload.optString("state", "no_circle")
        val headline = payload.optString("headline", "")
        val sub = payload.optString("sub", "")
        val circleName = payload.optString("circleName", "")
        val isCritical = payload.optBoolean("isCritical", false)

        views.setTextViewText(
            R.id.family_kicker,
            if (circleName.isNotBlank()) circleName.uppercase() else "FAMILY"
        )
        views.setTextViewText(R.id.family_headline, headline)
        views.setTextViewText(R.id.family_sub, sub)

        if (isCritical) {
            views.setInt(R.id.family_root, "setBackgroundResource", R.drawable.alrt_widget_bg_critical)
            views.setTextColor(R.id.family_kicker, 0xFFFFD9D5.toInt())
            views.setTextColor(R.id.family_headline, 0xFFFFFFFF.toInt())
            views.setTextColor(R.id.family_sub, 0xFFFFE3E0.toInt())
        } else {
            views.setInt(R.id.family_root, "setBackgroundResource", R.drawable.alrt_widget_bg)
            views.setTextColor(R.id.family_kicker, 0xFFB7B7C0.toInt())
            // "Everyone's safe" reads in success green; other states stay white.
            views.setTextColor(
                R.id.family_headline,
                if (state == "safe") 0xFF1EE28C.toInt() else 0xFFFFFFFF.toInt()
            )
            views.setTextColor(R.id.family_sub, 0xFFC9C9D2.toInt())
        }
    }
}

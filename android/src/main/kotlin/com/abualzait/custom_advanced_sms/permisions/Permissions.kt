package com.abualzait.custom_advanced_sms.permisions

import io.flutter.plugin.common.PluginRegistry

object Permissions {
    val requestsResultsListener = PluginRegistry.RequestPermissionsResultListener { requestCode, permissions, grantResults ->
        // Handle permission results here if needed
        false
    }
}

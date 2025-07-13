package com.abualzait.custom_advanced_sms

import android.content.Context
import android.telephony.SubscriptionInfo
import android.telephony.SubscriptionManager
import android.telephony.TelephonyManager
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class SimCardsProvider(private val context: Context, private val binding: ActivityPluginBinding) : MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getSimCards" -> {
                try {
                    val simCards = getSimCards()
                    result.success(simCards)
                } catch (e: Exception) {
                    result.error("ERROR", "Failed to get SIM cards", e.message)
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    private fun getSimCards(): List<Map<String, Any?>> {
        val simCards = mutableListOf<Map<String, Any?>>()
        
        try {
            val subscriptionManager = context.getSystemService(Context.TELEPHONY_SUBSCRIPTION_SERVICE) as SubscriptionManager
            val telephonyManager = context.getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
            
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP_MR1) {
                val activeSubscriptionInfos: List<SubscriptionInfo>? = subscriptionManager.activeSubscriptionInfoList
                
                activeSubscriptionInfos?.forEach { subscriptionInfo ->
                    val simCard = mutableMapOf<String, Any?>()
                    
                    simCard["slot"] = subscriptionInfo.simSlotIndex
                    simCard["imei"] = getImei(telephonyManager, subscriptionInfo.simSlotIndex)
                    simCard["state"] = getSimState(telephonyManager, subscriptionInfo.simSlotIndex)
                    
                    simCards.add(simCard)
                }
            }
        } catch (e: SecurityException) {
            // Handle permission not granted case
            throw SecurityException("Required permissions not granted for reading SIM card information")
        } catch (e: Exception) {
            // Handle other exceptions
            throw Exception("Error reading SIM card information: ${e.message}")
        }
        
        return simCards
    }

    private fun getImei(telephonyManager: TelephonyManager, slotIndex: Int): String? {
        return try {
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                telephonyManager.getImei(slotIndex)
            } else {
                telephonyManager.deviceId
            }
        } catch (e: SecurityException) {
            null
        } catch (e: Exception) {
            null
        }
    }

    private fun getSimState(telephonyManager: TelephonyManager, slotIndex: Int): Int {
        return try {
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                telephonyManager.getSimState(slotIndex)
            } else {
                telephonyManager.simState
            }
        } catch (e: Exception) {
            TelephonyManager.SIM_STATE_UNKNOWN
        }
    }
}

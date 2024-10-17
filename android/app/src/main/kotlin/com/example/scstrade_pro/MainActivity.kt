package com.example.scstrade_pro

import android.app.DatePickerDialog
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.text.SimpleDateFormat
import java.util.*
import android.content.Intent
import android.net.Uri
import androidx.annotation.NonNull
class MainActivity: FlutterActivity(){
    private val channel = "com.example.native"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "openUrl" -> {
                    val url = call.argument<String>("url")
                    if (url != null) {
                        openUrl(url)
                        result.success(null)
                    } else {
                        result.error("INVALID_ARGUMENT", "URL is required", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun openUrl(url: String) {
        val webpage: Uri = Uri.parse(url)
        val intent = Intent(Intent.ACTION_VIEW, webpage)
        startActivity(intent)
    }

    private fun showDatePicker(result: MethodChannel.Result) {
        val calendar = Calendar.getInstance()
        val year = calendar.get(Calendar.YEAR)
        val month = calendar.get(Calendar.MONTH)
        val day = calendar.get(Calendar.DAY_OF_MONTH)

        val datePickerDialog = DatePickerDialog(this, { _, selectedYear, selectedMonth, selectedDay ->
            val selectedDate = Calendar.getInstance()
            selectedDate.set(selectedYear, selectedMonth, selectedDay)
            val format = SimpleDateFormat("dd-MM-yyyy", Locale.getDefault())
            result.success(format.format(selectedDate.time))
        }, year, month, day)
        datePickerDialog.datePicker.calendarViewShown = false
        datePickerDialog.datePicker.spinnersShown = true
        datePickerDialog.setOnCancelListener {
            result.success("")
        }

        datePickerDialog.show()
    }
}

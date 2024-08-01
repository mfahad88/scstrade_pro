package com.example.scstrade_pro

import android.app.DatePickerDialog
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.text.SimpleDateFormat
import java.util.*
class MainActivity: FlutterActivity(){
    private val CHANNEL = "com.example.datepicker/date"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "showDatePicker") {
                showDatePicker(result)
            } else {
                result.notImplemented()
            }
        }
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

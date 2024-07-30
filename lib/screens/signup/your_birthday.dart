import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/views/heading_text.dart';
import 'package:scstrade_pro/screens/views/sub_heading_text.dart';
import 'package:scstrade_pro/screens/views/text_field.dart';

import '../AppConstants.dart';
import '../controller/signup_controller.dart';
class YourBirthday extends StatelessWidget {

  DateTime? _selectedDate;
  YourBirthday({super.key});

  Future<void> _selectDate(BuildContext context,SignupController controller) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year - 100), // Allow dates from 100 years ago
      lastDate: DateTime(
          now.year + 100), // Allow dates up to 100 years in the future
    );

    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      controller.dob = '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
    }
  }
  @override
  Widget build(BuildContext context) {

    SignupController controller=context.read<SignupController>();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText(Appconstants.when_is_your_birthday),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: const SubHeadingText(Appconstants.date_of_birth),
            ),
            Expanded(
              child: Textfield(
                context,
                readOnly: true,
                controller: controller.textEditingControllerDob,
                onTap: () => _selectDate(context,controller),

              ),
            )

          ],
        ),
      ),
    );

  }
}

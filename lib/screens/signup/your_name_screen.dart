import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../AppConstants.dart';

class YourNameScreen extends StatefulWidget {
  final Function (String) listener;
  const YourNameScreen({required this.listener});

  @override
  State<YourNameScreen> createState() => _YourNameScreenState();
}

class _YourNameScreenState extends State<YourNameScreen> {
  late TextEditingController nameController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController=TextEditingController();
    nameController.addListener(() {
      widget.listener(nameController.text);
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(Appconstants.what_is_your,
              style: context.textTheme.headlineLarge
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Text(
            Appconstants.full_name,
            style: context.textTheme.headlineMedium,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: context.textTheme.headlineMedium,
            keyboardType: TextInputType.name,
            controller: nameController,

          ),
        )
      ],
    );
  }
}


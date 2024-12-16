import 'package:flutter/material.dart';

class showErrorDialog extends StatelessWidget {
  final Widget content;
  final VoidCallback onPressed;
  final BuildContext context;
  const showErrorDialog({super.key,required this.context,required this.content,required this.onPressed});

  @override
  Widget build(BuildContext _) {
    Future.microtask(() =>
        showDialog(context: _, builder: (context) {
      return AlertDialog(
        title: const Text('Error'),
        content: content,
        actions: [
          TextButton(onPressed: onPressed, child: const Text('Ok'))
        ],
      ) ;
    },),
    );

    return Center(
      child: Container(),
    );
  }
}

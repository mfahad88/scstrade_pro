import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(

          children: [
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Portfolio'),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Realtime Chart'),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Account'),
            )
          ],
        ),
      );
  }
}

import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  final Function(String value) onTap;
  const MoreScreen({super.key,required this.onTap});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              ),

            ],
          ),
        ),
    );
  }
}

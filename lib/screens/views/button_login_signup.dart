import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/controller/signup_controller.dart';

import '../signup/sign_up_screen.dart';

class BottomLoginSignup extends StatelessWidget {
  const BottomLoginSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF12D18E),
              foregroundColor: const Color(0xFFFFFFFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              )
          ), child: const Text("Sign up"),
        ),
        ElevatedButton(onPressed: (){
        },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE7FAF4),
              foregroundColor: const Color(0xFF12D18E),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              )
          ), child: const Text("Sign in"),
        )

      ],
    );
  }
}
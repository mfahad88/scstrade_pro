import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/AppConstants.dart';
import 'package:scstrade_pro/screens/controller/signup_controller.dart';
import 'package:scstrade_pro/screens/controller/theme_controller.dart';
import 'package:scstrade_pro/screens/signup/take_picture_screen.dart';
import 'package:scstrade_pro/screens/views/heading_text.dart';
import 'package:scstrade_pro/screens/views/my_button.dart';

class UploadNationalCard extends StatelessWidget {

  const UploadNationalCard( {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeadingText(Appconstants.your_national_id),
          Container(
            margin: const EdgeInsets.only(top:10),
            child: const Text(Appconstants.regulation_nation_id),
          ),
          Container(
            height: 200,
            width: 500,
            margin: const EdgeInsets.only(top: 20.0),
            decoration: const BoxDecoration(
              // gradient: const LinearGradient(colors: [Color(0xff12D18E),Color(0xFF71E3BB)]),
              color: Color(0x509E9E9E),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: GradientBoxBorder(
                width: 2,
                gradient: LinearGradient(colors: [Color(0xff12D18E),Color(0xFF71E3BB)]),
              )
         
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SvgPicture.asset("images/image_upload.svg"),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                      child: const Text("Select file",style: TextStyle(
                        color: Color(0xFF9E9E9E)
                      ),))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children:<Widget>[
                Expanded(
                  child: Container(
                    height: 2,
                    color: const Color(0xFFEEEEEE),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text("OR")),
                Expanded(
                  child: Container(
                    height: 2,
                    color: const Color(0xFFEEEEEE),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: MyButton(text: "Open Camera & Take Photo",
                textColor: const Color(0xFF12D18E),
                backgroundColor: const Color(0xFFE7FAF4),
                borderRadius: 25,
                rtl: true, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TakePictureScreen(camera: context.read<ThemeController>().camera.first)));
                  // context.read<SignupController>().mainNavigation.currentState!.pushNamed("/takePicture");
            }, iconData: Icons.camera_alt),
          ),
         /* Expanded(
            child: Container(
              child: TakePictureScreen(
                // Pass the appropriate camera to the TakePictureScreen widget.
                camera: context.read<ThemeController>().camera.first,
              ),
            ),
          )*/
        ],
      ),
    );
  }
}

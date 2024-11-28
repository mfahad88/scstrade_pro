import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/home/ui/home_screen.dart';

import '../../../helper/Utils.dart';
import '../viewmodel/login_viewmodel.dart';

class RealTrading extends StatelessWidget {
  final BuildContext context;
  const RealTrading(this.context,{
    super.key,
  });

  @override
  Widget build(BuildContext _) {
    return Consumer<LoginViewModel>(builder: (_, value, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            width: double.infinity,
            child: TextField(
              cursorColor: Color(0xFF2CE52F),
              decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    color: Color(0xFF737180),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color:Color(0xFF2CE52F)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color:Utils.isDark(context)?Color(0xFF737180):Color(0xFFE1E1E1)),
                    borderRadius: BorderRadius.circular(8),
                  )
              ),
            ),
          ),
          Gap(12),
          SizedBox(
            width: double.infinity,
            child:  TextField(
              cursorColor: Color(0xFF2CE52F),
              obscureText: value.obscureText,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Color(0xFF737180),
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  height: 0.08,
                ),
                suffixIcon: IconButton(onPressed: () => value.obscureText=!value.obscureText, icon: Icon(value.obscureText?Icons.visibility:Icons.visibility_off)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color:Utils.isDark(context)?Color(0xFF737180):Color(0xFFE1E1E1)),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color:Color(0xFF2CE52F)),
                  borderRadius: BorderRadius.circular(8),
                ),

              ),

            ),
          ),

          Row(
            children: [
              Checkbox(
                checkColor: Utils.isDark(context)?Colors.white:Color(0xFF222230),
                activeColor: Color(0xFF2CE52F),
                value: value.isChecked, onChanged: (v) => value.isChecked=!value.isChecked,
              ),
              Text('Remember Me',style: Theme.of(context).textTheme.bodyLarge,),
              Spacer(),
              Text('Forget Password',style: Theme.of(context).textTheme.bodyLarge,),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(onPressed: () {
                  Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(context),));
                }, child: Text('Login',style: Theme.of(context).textTheme.bodyLarge,),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2CE52F),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),

                ),
              ),
              Gap(10),
              Expanded(
                child: ElevatedButton(onPressed: () {

                }, child: Text('Open Account'
                  ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Color(0xFF2CE52F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF142117),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )

                  ),),
              )
            ],
          )
        ],
      );
    },);
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/viewmodels/login_viewmodel.dart';
import 'package:scstrade_pro/views/screens/main_screen.dart';
import 'package:scstrade_pro/views/widgets/otp_box.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    LoginViewModel viewModel=context.read();
    String? mobileNo;
    Utils.fetchCredentials('mobileNo').then((value) => mobileNo=value,);
    viewModel.startTimer();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Utils.percentToPx(percent: 13, size: screenSize,isWidth: false),
        automaticallyImplyLeading: false,
        leadingWidth: 300,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding:EdgeInsets.symmetric(vertical: Utils.percentToPx(percent: 0.8, size: screenSize,isWidth: false),horizontal: Utils.percentToPx(percent: 2, size: screenSize)) ,
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                    Text('Back',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white
                    ),)
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Gap(Utils.percentToPx(percent: 5, size: screenSize)),
                Text('Register An Account',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white
                ),),
              ],
            )
          ],
        ),
        flexibleSpace: Image.asset('images/toolbar.png',fit: BoxFit.fill,),
      ),
      body: Consumer<LoginViewModel>(builder: (BuildContext context, LoginViewModel value, Widget? child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Utils.percentToPx(percent: 10, size: screenSize)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(Utils.percentToPx(percent: 7, size: screenSize,isWidth: false)),
              Align(
                alignment: Alignment.center,
                child: Text('OTP Code',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Utils.isDark(context)?MaterialTheme.darkScheme().secondaryFixedDim:MaterialTheme.lightScheme().primary,
                    fontWeight: FontWeight.w700
                ),),
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Please type a OTP verification code sent to',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(text: '(+92) 314 3966681 & your email.',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600
                        ))
                      ]
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: screenSize.width
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 21),
                  child: Row(
                      children: [
                        Expanded(
                          child: OtpBox(
                            onChanged: (value) {
                              if(value.length==1){

                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ),
                        Gap(8),
                        Expanded(
                          child: OtpBox(
                            onChanged: (value) {
                              if(value.isEmpty){
                                FocusScope.of(context).previousFocus();
                              }
                              if(value.length==1){

                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ),
                        Gap(8),
                        Expanded(
                          child: OtpBox(
                            onChanged: (value) {
                              if(value.isEmpty){
                                FocusScope.of(context).previousFocus();
                              }
                              if(value.length==1){

                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ),
                        Gap(8),
                        Expanded(
                          child: OtpBox(
                            onChanged: (value) {
                              if(value.isEmpty){
                                FocusScope.of(context).previousFocus();
                              }
                              if(value.length==1){

                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ),
                        Gap(8),
                        Expanded(
                          child: OtpBox(
                            onChanged: (value) {
                              if(value.isEmpty){
                                FocusScope.of(context).previousFocus();
                              }
                              if(value.length==1){

                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        )

                      ]
                  ),
                ),
              ),
              Gap(20.0),
              FilledButton(
                  onPressed: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MainScreen(),)),
                  child: Text('Verify & Continue',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white
                    ),
                  )
              ),
              Gap(14.0),
              Text('Didn\'t receive SMS & Email?',
                style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,
              ),
              GestureDetector(
                child: Text('Resend in ${viewModel.counter} Sec',style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
                onTap: () => value.counter==0?value.startTimer():null,
              )
            ],
          ),
        );
      },

      ),
    );
  }
}

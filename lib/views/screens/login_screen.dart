import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/main.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/viewmodels/login_viewmodel.dart';
import 'package:scstrade_pro/views/screens/otp_screen.dart';
import 'package:scstrade_pro/views/widgets/greyOverlay.dart';
import 'package:scstrade_pro/views/widgets/mCard.dart';
import 'package:scstrade_pro/views/widgets/m_checkbox.dart';
import 'package:scstrade_pro/views/widgets/m_dropdown.dart';
import 'package:scstrade_pro/views/widgets/showErrorDialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/response/api_response.dart';
import '../widgets/m_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    LoginViewModel viewModel = context.read();
    viewModel.fetchKseIndices();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Consumer<LoginViewModel>(
        builder: (_,value,child) {
          if(value.responseKseIndices?.status==Status.loading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(value.responseKseIndices?.status==Status.error){
            return showErrorDialog(context: context, content: Text(value.responseKseIndices?.message??''), onPressed: () => Navigator.of(context).pop(),);
          }else{
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: Utils.percentToPx(percent: 5, size: screenSize)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 138.r,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                            width: 355.r,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0.r,horizontal: 2.0.r),
                              child: mCard(kseIndices: value.responseKseIndices!.data![index],spots: value.spots,),
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(),
                          itemCount: value.responseKseIndices!.data!.length),
                    ),
                    Gap(Utils.percentToPx(percent: 2, size: screenSize,isWidth: false)),
                    mTextField(
                      label: 'Full Name',
                      hintText:'Enter your Name' ,
                      controller: value.fullNameController,
                      keyboardType: TextInputType.name,
                    ),
                    Gap(Utils.percentToPx(percent: 1.7, size: screenSize,isWidth: false)),
                    mTextField(
                      hintText: 'Enter your email',
                      label: 'Email',
                      controller: value.emailController,
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow( RegExp(r'[a-zA-Z0-9._%+-@]'))
                      ],

                    ),
                    Gap(Utils.percentToPx(percent: 1.7, size: screenSize,isWidth: false)),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: mDropdown<String>(
                            value: value.selectedCountryCode,
                            // width: Utils.percentToPx(percent: 28, size: screenSize),
                            dropdownMenuEntries: value.countryCode,
                            onSelected: (v) =>value.selectedCountryCode=v! ,),
                        ),
                        Gap(Utils.percentToPx(percent: 2, size: screenSize),),
                        Expanded(
                          flex: 5,
                          // width: Utils.percentToPx(percent: 65, size: screenSize),
                          child: mTextField(
                            hintText: 'Enter your mobile number',
                            label: 'Mobile Number',
                            controller: value.mobileController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            maxLength: 10,
                          ),
                        ),
                      ],
                    ),
                    Gap(Utils.percentToPx(percent: 1, size: screenSize,isWidth: false)),
                    mCheckbox(title: 'Remember Me', value: value.isRemember, onChanged: (v) => value.isRemember=v??false,),
                    Gap(Utils.percentToPx(percent: 1.5, size: screenSize,isWidth: false)),
                    FilledButton(onPressed: () {
                      value.submitRegister(context).then((v) => observeRegister(context:context,value:value),);
                      print('Status: ${value.responseRegister.status}');
                      

                    }, child: Text('Register',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white
                    ),)),
                    Gap(Utils.percentToPx(percent: 2, size: screenSize,isWidth: false)),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Utils.isDark(context)?const Color(0xFF333333):MaterialTheme.lightScheme().scrim.withOpacity(0.6),
                    ),
                    Gap(Utils.percentToPx(percent: 1.7, size: screenSize,isWidth: false)),
                    Align(
                      alignment: Alignment.center,
                      child: Text('Continue with Google/Facebook',
                        style: Theme.of(context).textTheme.bodyLarge,),
                    ),
                    Gap(Utils.percentToPx(percent: 2, size: screenSize,isWidth: false)),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: Utils.percentToPx(percent: 7, size: screenSize,isWidth: false),
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Color(0xFFC7C7CC),
                                        width: 1
                                    )
                                )
                            ),
                            child: Image.asset('images/google.png'),
                          ),
                        ),
                        Gap(Utils.percentToPx(percent: 5, size: screenSize),),
                        Expanded(
                          child: Container(
                            height: Utils.percentToPx(percent: 7, size: screenSize,isWidth: false),
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Color(0xFFC7C7CC),
                                        width: 1
                                    )
                                )
                            ),
                            child: Image.asset('images/facebook.png'),
                          ),
                        )
                      ],
                    ),
                    Gap(Utils.percentToPx(percent: 5, size: screenSize,isWidth: false)),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('images/scs_logo.png'),
                            Gap(Utils.percentToPx(percent: 1, size: screenSize)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('SCS Trade Pro',style: Theme.of(context).textTheme.bodyLarge,),
                                Text('Committed to intelligent investing',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 8.0
                                ))
                              ],
                            ),
                            Spacer(),
                            Text('Version 1.0',style: Theme.of(context).textTheme.titleSmall,)
                          ],
                        )),
                    Gap(Utils.percentToPx(percent: 5, size: screenSize,isWidth: false)),
                  ],
                ),
              ),
            );
          }
        }
    );
  }

  void observeRegister({required BuildContext context, required LoginViewModel value}) {
      print('Status: ${value.responseRegister.status}');
    if(value.responseRegister.status==Status.completed){
      print(value.responseRegister.data);
      Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => OtpScreen(),));
      // Navigator.of(context).pop();

    }else if(value.responseRegister.status==Status.error) {
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: Text('Error'),
            content: Text(value.responseRegister.message ?? ''),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(),
                  child: Text('ok'))
            ],
          ),
        barrierDismissible: false,
      );
      // showErrorDialog(context:context ,content: Text(response.message??''),onPressed: () => Navigator.of(context).pop(),);
    }
  }
}

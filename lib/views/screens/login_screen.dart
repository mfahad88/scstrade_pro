import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/main.dart';
import 'package:scstrade_pro/viewmodels/login_viewmodel.dart';
import 'package:scstrade_pro/views/widgets/mCard.dart';
import 'package:scstrade_pro/views/widgets/showErrorDialog.dart';

import '../../models/response/api_response.dart';

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

    return Consumer<LoginViewModel>(
        builder: (context,value,child) {
          if(value.responseKseIndices?.status==Status.loading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(value.responseKseIndices?.status==Status.error){
            return showErrorDialog(context: context, content: Text(value.responseKseIndices?.message??''), onPressed: () => Navigator.of(context).pop(),);
          }else{
            return LayoutBuilder(
                builder: (context,constraints) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: constraints.maxHeight*0.22,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => SizedBox(
                                  width: constraints.maxWidth*0.9,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 2.0),
                                    child: mCard(kseIndices: value.responseKseIndices!.data![index],spots: value.spots,),
                                  ),
                                ),
                                separatorBuilder: (context, index) => const SizedBox(),
                                itemCount: value.responseKseIndices!.data!.length),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Enter your Name',
                                label: Text('Full Name')
                            ),
                          ),
                          Gap(10.0),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Enter your email',
                                label: Text('Email')
                            ),
                          ),
                          Gap(10.0),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Enter your mobile number',
                                label: Text('Mobile Number')
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
          }
        }
    );
  }
}

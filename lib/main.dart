import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/models/todos/Todos.dart';
import 'package:scstrade_pro/repositories/todo_repository.dart';
import 'package:scstrade_pro/services/api_client.dart';
import 'package:scstrade_pro/viewmodels/todo_viewmodel.dart';
import 'package:scstrade_pro/widgets/showErrorDialog.dart';

import 'models/todos/Todo.dart';



void main() async {
  // runApp(MyApp());
/*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCiaZmvExqmK7SLexwtkCoF4mVjm8GoDHI',
        appId: '1:340217773345:android:cab967fd3e66485dfb5260',
        messagingSenderId: '340217773345',
        projectId: 'scstradepro',
      )
  );*/
  final _apiClient=ApiClient();
  final _todoRepository=TodoRepository(_apiClient);
  final _todoViewModel=TodoViewModel(_todoRepository);
  runApp(
      MultiProvider(
          providers: [
          ChangeNotifierProvider(create: (context) => _todoViewModel,)

          ],
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    TodoViewModel viewModel=context.read();
    viewModel.fetchTodos(true);
    return MaterialApp(

      home: Scaffold(
        body: SafeArea(
          top: true,
          minimum: const EdgeInsets.all(40),
          child: Column(
          
            children: [
              TextButton(onPressed: () => viewModel.fetchTodos(false),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade300
                ),
                child: const Text('Reload'),
              ),
              const Gap(10),
              Consumer<TodoViewModel>(
                  builder: (_, value, child) {

                    final response = value.responseTodos;

                    switch(response?.status){
                      case Status.loading :
                        return const Center(child: CircularProgressIndicator(),);
                      case Status.completed:
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: response?.data?.todos?.length??0,
                            itemBuilder: (context, index) {
                              Todos? todo=response?.data?.todos?[index];
                              return ListTile(
                                leading: Text(todo?.id.toString()??'0'),
                                title: Text(todo?.todo??'No record found'),
                                trailing: Text(todo?.completed.toString()??'No status'),
                              );
                            },),
                        );
                      case Status.error:
                        return Builder(
                          builder: (context) {
                            return showErrorDialog(
                              context: context,
                              content: Text(response?.message??""),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            );
                          }
                        );
                        // return Center(child: Container(),);
                      default:
                        return const Center(child: Text('Unknown state'),);
                    }
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
  

}




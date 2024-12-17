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
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/viewmodels/todo_viewmodel.dart';
import 'package:scstrade_pro/widgets/showErrorDialog.dart';

import 'theme/app_theme.dart';
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
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = Utils.createTextTheme(context, "Inter", "Roboto");

    MaterialTheme theme = MaterialTheme(textTheme);
    TodoViewModel viewModel=context.read();
    viewModel.fetchTodos(true);
    return MaterialApp(
      // theme: AppTheme.lightTheme,
     /* theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: MaterialTheme.lightScheme()
      ),*/
      theme: Utils.isDark(context)?theme.dark():theme.light(),

      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        body: SafeArea(
          top: true,
          minimum: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
            
              children: [
                ElevatedButton(onPressed: () => viewModel.fetchTodos(false), child: Text('Reload')),
                OutlinedButton(onPressed: () => print('Clicked'), child: Text('Button'),),
                TextButton(onPressed: () => print('Clicked'), child: Text('Button')),
                IconButton(onPressed: () => print('Clicked'), icon: Icon(Icons.add)),
                Icon(Icons.ac_unit),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'PlaceHolder',

                  ),
                ),
                DropdownMenu(
                  width: 400,
                    dropdownMenuEntries: [
                  DropdownMenuEntry(value: '1', label: 'First'),
                  DropdownMenuEntry(value: '2', label: 'First'),
                  DropdownMenuEntry(value: '3', label: 'First'),
                  DropdownMenuEntry(value: '4', label: 'First')
                ]),
                ListTile(
                  title: Text('First'),
                  leading: Radio(value: 'First', groupValue: 'First', onChanged: (value) => print(value),)
                ),
                ListTile(
                    title: Text('First'),
                    leading: Radio(value: 'Second', groupValue: 'First', onChanged: (value) => print(value),)
                ),
                ListTile(
                    title: Text('First'),
                    leading: Checkbox(value: false, onChanged: (value) => print(value),)
                ),
                ListTile(
                    title: Text('Second'),
                    leading: Checkbox(value: true, onChanged: (value) => print(value),)
                ),
                CircularProgressIndicator(
                  value: 0.5,
                  strokeWidth: 1,
                ),
                Text('Hello World',style: theme.textTheme.titleSmall,),
                Container(
                  color: Utils.isDark(context)?theme.extendedColors.first.dark.colorContainer:theme.extendedColors.first.light.colorContainer,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Center(child: Text('Hello',style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Utils.isDark(context)?theme.extendedColors.first.dark.color:theme.extendedColors.first.light.color
                    ),)),
                  ),
                ),
                Gap(10),
               /* Consumer<TodoViewModel>(
                    builder: (_, value, child) {
            
                      final response = value.responseTodos;
            
                      switch(response?.status){
                        case Status.loading :
                          return const Center(child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(AppTheme.primaryColor),
                            strokeWidth: 0.5,
                          ),);
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
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
  

}




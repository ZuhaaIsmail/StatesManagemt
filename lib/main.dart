import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_mgmt_project/providers/counter_provider.dart';
import 'package:states_mgmt_project/providers/student_data_provider.dart';
import 'package:states_mgmt_project/screens/counter_screen.dart';
import 'package:states_mgmt_project/screens/std_home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StudentDataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
      ),
      home: StdHomeScreen(),
    );
  }
}

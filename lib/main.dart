import 'package:blocbase/screens/firstpage.dart';
import 'package:blocbase/screens/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => NavigationCubit(),
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
      title: 'blocbase',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        
        useMaterial3: true,
      ),
      home: const FirstScreen(),
    );
  }
}

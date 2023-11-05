import 'package:flutter/material.dart';

import 'Main_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      title: 'Flutter Demo',
      
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
         home: const  Loginscreen(),
    );
  }
}


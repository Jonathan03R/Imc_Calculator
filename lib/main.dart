import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/screens/imc_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary, 
          foregroundColor: Colors.white, 
          title: Text("IMC calculadora Jona")),
        backgroundColor: AppColors.background,
        body: ImcHomeScreen(),
      ),
    );
  }
}

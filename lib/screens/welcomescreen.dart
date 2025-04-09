import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
      Column(
          mainAxisSize: MainAxisSize.min,
        children: [
             Image.asset(
              'assets/images/blocbase_logo.png',
              width: 250, 
             opacity: AlwaysStoppedAnimation(0.79)
            ),
          
                Text(
                  "Welcome to BlocBase 🧱",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Explore amazing features using the menu ☰",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20)
                
        ])));
            
         
  }
}
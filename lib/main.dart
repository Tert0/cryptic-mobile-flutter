import 'package:flutter/material.dart';
import 'package:cryptic_mobile/login_screen.dart';
import 'package:cryptic_mobile/locator.dart';

void main() { 
  setupLocator();
  print("Setuped Locator");
  runApp(MaterialApp(home: LoginScreen()));  
}
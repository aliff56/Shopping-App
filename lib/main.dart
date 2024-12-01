import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/home_page.dart';
import 'package:shopping_app/providers/product_provider.dart';


void main() {
  runApp(const MyApp());
}
class  MyApp extends StatelessWidget {
  const  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        home:  const HomePage(),
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: const ColorScheme.dark(
            surface: Color(0xFFBEC5AD)
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Poppins',
            ),
            prefixIconColor: Color.fromARGB(255, 255, 255, 255)
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromRGBO(59, 82, 73, 1),
              fontFamily: 'Poppins',
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromRGBO(59, 82, 73, 1),
              fontFamily: 'Poppins',
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35, 
              color: Color.fromRGBO(59, 82, 73, 1),
              fontFamily: 'Poppins',
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(59, 82, 73, 1),
              fontFamily: 'Poppins',
            )
          ),
        ),
        
      ),
    );
  }
}
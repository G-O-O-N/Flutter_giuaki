import 'package:giuaki/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

Color primaryColor() {
  return const Color(0xFF292826);
}

Color backgroundColor() {
  return const Color(0xFFF9D342);
}

Color textColor() {
  return const Color(0xFFFFFFFF);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bài thi giữa kỳ",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: backgroundColor(),
        appBarTheme: AppBarTheme(
          color: primaryColor(),
          titleTextStyle: TextStyle(
            color: textColor(),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor(),
            foregroundColor: textColor(),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: textColor()),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor(),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: textColor()),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor(),
        title: Text(
          widget.title,
          style: TextStyle(color: textColor()), // Màu chữ của AppBar
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: TextStyle(color: textColor(), fontSize: 24), // Màu chữ hiển thị
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: primaryColor(),
        tooltip: 'Increment',
        child: Icon(Icons.add, color: textColor()), // Màu biểu tượng trên nút
      ),
    );
  }
}

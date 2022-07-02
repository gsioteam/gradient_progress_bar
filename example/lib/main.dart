import 'package:flutter/material.dart';
import 'package:gradient_progress_bar/gradient_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gradient Progress Indicator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Gradient Progress Indicator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            GradientProgressIndicator([
              Color(0xffF68270),
              Color(0xffF1C358),
              Color(0xffEFDE62),
              Color(0xffE5F3BE),
              Color(0xffCDE8F1),
              Color(0xffDDC5EE),
              Color(0xffF2E0F9),
            ], 0.6)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fuppies_app/page/log_food_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogFoodPage()),
                );
              },
              child: const Text('Log Food'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                debugPrint('pressed Log Symptom');
              },
              child: const Text('Log Symptom'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                debugPrint('pressed Add Safe Food');
              },
              child: const Text('Add Safe Food'),
            ),
          ],
        ),
      ),
    );
  }
}

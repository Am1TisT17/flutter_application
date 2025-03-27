import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int counter = 0;
  int buttonPressCount = 0;
  String displayText = '';
  Color backgroundColor = Colors.white;

  final TextEditingController _textController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      counter++;
      buttonPressCount++;
    });
  }

  void _addText() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Text'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(hintText: 'Type something...'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  displayText = _textController.text;
                  buttonPressCount++;
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _removeText() {
    setState(() {
      displayText = '';
      buttonPressCount++;
    });
  }

  void _changeBackgroundColor() {
    setState(() {
      backgroundColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      buttonPressCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              displayText,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addText,
              child: const Text('Add Text'),
            ),
            ElevatedButton(
              onPressed: _removeText,
              child: const Text('Remove Text'),
            ),
            ElevatedButton(
              onPressed: _changeBackgroundColor,
              child: const Text('Change Background Color'),
            ),
            const SizedBox(height: 20),
            Text(
              'Total button presses: $buttonPressCount',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

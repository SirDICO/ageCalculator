import 'dart:io';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AgeCalculator());
}

class AgeCalculator extends StatelessWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  int year = DateTime.now().year;
  int? age;
  calculateAge() {
    print('object');
    setState(() {
      if (textEditingController.text.isEmpty) {
        FlushbarHelper.createError(message: 'Provide Year first!')
            .show(context);
        // ScaffoldMessenger.maybeOf(context).showSnackBar(SnackBar(content: content))
      } else {
        age = year - int.parse(textEditingController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Age Machine"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (age != null) Text('You are $age years old'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                hintText: "Year of Birth Eg (1999)",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          ElevatedButton(
            onPressed: () => calculateAge(),
            child: const Text(
              'Calculate My Age',
            ),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bin2Dec',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '이진법을 십진법으로?'),
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
  FocusNode inputFocusNode = FocusNode();
  String decimalNumber = '?';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        inputFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                focusNode: inputFocusNode,
                decoration:
                    const InputDecoration(hintText: '이진법 숫자(0,1)를 입력해주세요'),
                maxLength: 8,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.always,
                validator: (String? value) {
                  if (value != null && value.contains(RegExp("[2-9]"))) {
                    return '0, 1 중에만 입력해주세요.';
                  } else {
                    return null;
                  }
                },
                onChanged: (String? value) {
                  if (value != null &&
                      value.isNotEmpty &&
                      !value.contains(RegExp("[2-9]"))) {
                    decimalNumber = int.parse(value, radix: 2).toString();
                  } else {
                    decimalNumber = '?';
                  }
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                '십진법 숫자',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                decimalNumber,
                style: TextStyle(
                    fontSize: 30, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<int> _itemData = <int>[9, 2, 4];
  int _itemCounter = 3;

  void _addNewData() {
    _itemData.add(Random().nextInt(10));
    setState(() {
      _itemCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Widget Test Demo"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'You have this many data items: $_itemCounter',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(height: 10),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: _itemCounter,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.blue.shade100,
                          child: Center(
                              child: Text(
                                  "Item no ${index + 1}, value: ${_itemData[index]}",
                                  style: const TextStyle(
                                      color: Colors.blueGrey))));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addNewData,
          tooltip: 'Add new data',
          child: const Icon(Icons.add),
        ));
  }
}

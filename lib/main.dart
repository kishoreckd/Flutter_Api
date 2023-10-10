// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<dynamic> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/todos');

      setState(() {
        list = response.data as List;
        print(list);
      });
      // print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Fetch Api',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            int num = list[index]["id"];
            String str = "$num";
            return Card(
              child: ListTile(
                title: Text('$num'),
                subtitle: Text(list[index]['title']),
              ),
            );
          }),
    );
  }
}

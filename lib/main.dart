import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiPage(),
    );
  }
}

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  List<dynamic> data = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Send an HTTP GET request and decode the JSON response
  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load data (Status: ${response.statusCode})';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load data';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (isLoading) {
      body = const Center(child: Text('Loading...'));
    } else if (errorMessage.isNotEmpty) {
      body = Center(
        child: Text(errorMessage, style: const TextStyle(color: Colors.red)),
      );
    } else {
      body = ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${data[index]['id']}')),
            title: Text(data[index]['title']),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('API Data using HTTP'),
      ),
      body: body,
    );
  }
}

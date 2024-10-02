import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  final List<String> _myList = [];
  final TextEditingController _controller = TextEditingController();  // Fixed typo here (_controller)

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addMyItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _myList.add(task);
      });
      _controller.clear();
    }
  }

  void _deleteMyItem(int index) {
    setState(() {
      _myList.removeAt(index);  // Fixed variable name (_myList instead of _todoList)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a Task',  // Fixed typo (labelText instead of lableText)
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _addMyItem(_controller.text),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _myList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_myList[index]),  // Fixed widget hierarchy
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteMyItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

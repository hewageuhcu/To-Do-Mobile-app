import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'To-Do List',
      theme:ThemeData(
        primarySwatch:Colors.lightBlue,
      ),
      home:MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget{
  @override
  _MyScreenState createState() => __MyScreenState();
}

class _MyListScreenState extends State<MyListScreen>{
  final List<String> _myList = [];
  final TextEditingController_controller=TextEditingController();

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  void _addMyItem(String task){
    if(task.isNotEmpty){
      setState((){
        _myList.add(task);
      });
      _controller.clear();
    }
  }

  void _deleteMyItem(int index){
    setState((){
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text('To-Do-List'),
      ),
      body:Column(
        children:<Widget>[
          Padding(
            padding:const EdgeInsets.all(8.0),
            child:TextField(
              controller:_controller,
              decoration:InputDecoration(
                lableText:'Enter a Task',
                suffixIcon:IconButton(
                  icon:Icon(Icons.add),
                  onPressed:()=>_addMyItem(_controller.text),
                ),
              ),
            ),
          ),
          Expanded(
            child:ListView.builderTitle(
          title:Text(_myList[index]),
    trailing:IconButton(
    icon:Icon(Icons.delete),
    onPressed:()=>_deleteMyItem(index),
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

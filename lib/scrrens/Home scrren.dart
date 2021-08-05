import 'package:flutter/material.dart';
import 'package:to_do2/scrrens/archef_task.dart';
import 'package:to_do2/scrrens/done_task.dart';
import 'package:to_do2/scrrens/new_task.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controllerTitle = TextEditingController();
  var controllerTime = TextEditingController();
  var controllerDate = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndexes = 0;
  List<Widget> scrrens = [
    NewTask(),
    DoneTask(),
    ArchefTask(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('my todo'),
      ),
      body: scrrens[currentIndexes],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scaffoldKey.currentState.showBottomSheet((context) => Container(
                child: Form(
                  key: formKey,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name of task'),
                          controller: controllerTitle,
                        ),
                        SizedBox(
                          width: 10,
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name of task'),
                          controller: controllerTime,
                        ),
                        SizedBox(
                          width: 10,
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name of task'),
                          controller: controllerDate,
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndexes,
        onTap: (val) {
          setState(() {
            currentIndexes = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_ugc_outlined),
            label: " new Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: " done Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: " arch Tasks",
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, avoid_print, unused_element

import 'package:band_graphics/src/models/band_models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BandModels> bands = [
    BandModels(id: "1", name: "Bad Bunny", votes: 5),
    BandModels(id: "2", name: "50 Cent", votes: 5),
    BandModels(id: "3", name: "Cosculluela", votes: 5),
    BandModels(id: "4", name: "Wisin y Yandel", votes: 5),
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
        onPressed: _addBand,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "BAND CHART",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int i) {
          return _bandTile(bands[i]);
        },
      ),
    );
  }

  _bandTile(BandModels bands) {
    return Dismissible(
      key: Key(bands.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Delete",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      onDismissed: (direction){
        print(bands.id);
      },
      child: ListTile(
        title: Text(bands.name),
        leading: CircleAvatar(
          child: Text(
            bands.name.substring(0, 1),
          ),
        ),
        trailing: Text(bands.votes.toString()),
        onTap: () {
          print(bands.name);
        },
      ),
    );
  }

  _addBand() {
    final TextEditingController textController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Band'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _validatorBand(textController.text);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.green),
                ),
              )
            ],
          );
        });
  }

  _validatorBand(String name) {
    if (name.length > 1) {
      //TODO agregar
      print('todo ok todo correcto');
    }
    Navigator.pop(context);
  }
}

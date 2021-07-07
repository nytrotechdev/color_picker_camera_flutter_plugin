import 'dart:io';

import 'package:flutter/material.dart';

import 'package:color_picker_camera/color_picker_camera.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _askCameraPermission();
    super.initState();
  }

  PermissionStatus _permissionStatus;

  void _askCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      // ColorPickerCamera.captureColorFromCamera().then((value) => exit(0));
    } else {
      exit(0);
    }
  }

  Color bgColor;
  String selectedColor = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Color Picker Camera"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello fellows :)"),
              SizedBox(
                height: 10,
              ),
              Text(selectedColor),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  ColorPickerCamera.captureColorFromCamera().then((value) {
                    setState(() {
                      selectedColor = value;
                      bgColor = Color(int.parse(value));
                    });
                  });
                },
                child: Text("Go To Camera"),
              )
            ],
          ),
        ));
  }
}

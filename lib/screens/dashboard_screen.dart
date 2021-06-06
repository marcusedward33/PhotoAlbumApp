import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class  LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State< LandingScreen> {

  //pickedFile imageFile;
  File imageFile;
  final picker = ImagePicker();

  _openGallery(BuildContext context) async {
    //imageFile = await picker.getImage(source: ImageSource.gallery);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    //imageFile = await picker.getImage(source: ImageSource.camera);
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Make a Choice!"),
        content: SingleChildScrollView(
          child:  ListBody(
            children: <Widget> [
              GestureDetector(
                child: Text("Gallery"),
                onTap: () {
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Camera"),
                onTap: () {
                  _openCamera(context);
                },
              )
            ],
          ),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
              // _decideImageView(),
              imageFile == null ? Text("No Image Selected") : Image.file(imageFile),
              RaisedButton(onPressed: (){
                showChoiceDialog(context);
              },child: Text("Select Image!"),)
            ],
          ),
        ),
      ),
    );
  }
}
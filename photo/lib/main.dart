import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


void main() {
  runApp(PhotoScreen());
}

class PhotoScreen extends StatefulWidget {
  PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final ImagePicker _picker = ImagePicker();
  File? PickedImage;
  fetchImage() async {
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  
  setState((){
    if(image==null){
      return;
    }
    PickedImage = File(image.path);
  });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffff4b26),
          leading: const Icon(Icons.arrow_back_sharp),
          centerTitle: true,
          title: const Text("Photos"),
          actions: const [
            Icon(Icons.domain_verification_outlined),
          ],
        ),
        body: Container(
        color: Colors.black,
        child: PickedImage==null? null: Image.file(PickedImage!),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: fetchImage,
              tooltip: 'Photo',
              child: const Icon(Icons.photo_outlined,),
          ),
      ),
    );
  }
}
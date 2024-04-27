import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class picker extends StatefulWidget {
  const picker({Key? key}) : super(key: key);

  @override
  State<picker> createState() => _pickerState();
}

class _pickerState extends State<picker> {
  String? _image;
  File? selectedImage;




  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> saveImage(String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('path', val);
  }

  Future<void> getImage(ImageSource source) async {
    final imagePath = await ImagePicker().pickImage(source: source);
    if (imagePath != null) {
      saveImage(imagePath.path.toString());
      setState(() {
        selectedImage = File(imagePath.path); // Update selectedImage here
      });
    }
  }

  Future<void> getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _image = preferences.getString('path');
      if (_image != null) {
        selectedImage = File(_image!); // Update selectedImage here as well
      }
    });
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      getImage(ImageSource.gallery);
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                            color: Colors.blue,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      getImage(ImageSource.camera);
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                            color: Colors.blue,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IconButton(
        onPressed: () {
          showImagePickerOption(context);
        },
        icon: Icon(
          Icons.add_a_photo,
          color: Colors.blue,
          size: 30,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: picker(),
  ));
}

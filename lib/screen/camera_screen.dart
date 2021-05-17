import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  PickedFile _imageFile;
  TextEditingController nameController = TextEditingController();
  dynamic _pickImageError;

  Widget _visualiserimage(){
    if ( _imageFile != null) {
      File file = File(_imageFile.path);
      return Image(image: FileImage(file));
    } else if (_pickImageError != null) {
      return Text('Erreur de récupération d\image: $_pickImageError',
        textAlign: TextAlign.center,);
    } else {
      return Text('Aucune image',
        textAlign: TextAlign.center,);

    }
  }

  Future<void> _uploadImageMultiPart() async {
    //show your own loading or progressing code here
    try{
      String uploadurl = "http://jdevalik.fr/api/brocante/api/uploadmultipart.php";
      final Uri uri = Uri.parse(uploadurl);
      var request = http.MultipartRequest('POST',uri);
      request.fields['name'] = nameController.text;
      var pic = await http.MultipartFile.fromPath("image", _imageFile.path);
      request.files.add(pic);
      var response = await request.send();
      if (response.statusCode == 200 ) {
        print('Image Uploaded');
        setState(() {
          _imageFile = null;
          nameController.clear();
        });

      }else{
        print('Image not Uploaded');
      }
    }catch(e){
      print("Error during converting to Base64");
      //there is error during converting file image to base64 encoding.
    }
  }

  void _onImageButtonPressed(ImageSource source) async {
    try {
      print('Enter picture');
      PickedFile  picture = (await ImagePicker.platform.pickImage(
          source: source)) ;
      setState(() {
        print('SetState picture');
        _imageFile = picture;
      });
    }
    catch(e){
      _pickImageError = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Prise & Envoi Photo',
           style: TextStyle(
             fontSize: 22,
             fontWeight: FontWeight.bold,
             color: Colors.white,
             fontFamily: 'IndieFlower',
             letterSpacing: 2.5,

           ),),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nom',
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _visualiserimage(),
            )],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: (){ _uploadImageMultiPart();},
              child: Icon(Icons.cloud_upload_rounded),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green[800],
              onPressed: (){_onImageButtonPressed(ImageSource.camera); },
              child: Icon(Icons.photo_camera),
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

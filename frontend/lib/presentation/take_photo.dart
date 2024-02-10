import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:frontend/presentation/app_bar.dart';
import 'package:frontend/presentation/result_page.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'bottom_navigation_bar.dart';
import 'home_page.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  File? _image;

  Future getImage(bool isCamera) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);

      if (pickedFile == null) {
        return;
      } else {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> sendImageToServer() async {
    try {
      if (_image == null) {
        return;
      }
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://10.5.192.204:8000/predict'),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          _image!.path,
          contentType: MediaType('image', '*/*'),
        ),
      );
      request.headers.addAll({'Content-type': "multipart/form-data"});
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Dialog(
            child: SizedBox(
              width: 200,
              height: 100,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularProgressIndicator(),
                    
                     Text("Loading"),
                  ],
                ),
              ),
            ),
          );
        },
      );
      final response = await request.send();

      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            json.decode(await response.stream.bytesToString());

        // ignore: use_build_context_synchronously
        navigateToResultScreen(context, data['modified_image']);
      } else {
        print("Failed to upload image. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error sending image to server: $e");
    }
  }

  void navigateToResultScreen(
      BuildContext context, String modifiedImageBase64) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            ResultPage(modifiedImageBase64: modifiedImageBase64),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isHomePage = false;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarDesign(showBackArrow: !isHomePage),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          OrientationBuilder(
            builder: (context, orientation) {
              double imageHeight = orientation == Orientation.portrait
                  ? screenHeight * 0.4
                  : screenWidth * 0.8;

              return _image != null
                  ? ClipRRect(
                      child: Image.file(
                        _image!,
                        width: screenWidth,
                        height: imageHeight,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Image.asset(
                      'images/image2.jpg',
                      width: screenWidth,
                      height: imageHeight,
                      fit: BoxFit.fill,
                    );
            },
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => getImage(true),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.image_rounded),
                        SizedBox(
                          width: screenWidth * 0.04,
                        ),
                        const Text('Pick an Image'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  ElevatedButton(
                    onPressed: () => getImage(false),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.browse_gallery_outlined),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        const Text('Select from Gallery'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  ElevatedButton(
                    onPressed: () => sendImageToServer(),
                    child: const Row(
                      children: <Widget>[
                        Icon(Icons.check),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Check an Image'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
  //     bottomNavigationBar: BottomNavigationBarPart(
  //       key: UniqueKey(),
  //   onTap: (index) {
  //     switch (index) {
  //       case 0:
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => const MyHomePage()),
  //         );
  //         break;
  //       case 1:
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => TakePhoto()),
  //         );
  //         break;
  //       // Add more cases here for other pages
  //     }
  //   },
  // ),
    );
  }
}

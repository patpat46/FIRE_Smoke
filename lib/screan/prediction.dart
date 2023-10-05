import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker();
  String _confidence = '';
  var predictText = '';
  var confidence = '';
  bool showText = true;
  bool showImage = true;
  bool hideText = false;

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults:
          2, //the amout of categories our neural network can predict (here no. of animals)
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output!;
      _loading = false;

      if (_output[0]['label'] == 'Fire') {
        setState(() {
          predictText = 'โอกาศไม่เกิดไฟป่า';
        });
      } else {
        setState(() {
          predictText = 'โอกาศเกิดไฟป่า';
        });
      }

      // ignore: unnecessary_null_comparison
      _confidence = _output != null
          ? (_output[0]['confidence'] * 100.0).toString().substring(0, 2)
          : "";
    });
  }

  loadModel() async {
    //this function loads our model
    await Tflite.loadModel(
      model: 'assets/yourmodel.tflite',
      labels: 'assets/labels.txt',
    );
  }

  pickImage() async {
    //this function to grab the image from camera
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
      showText = false;
      showImage = false;
      hideText = true;
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
      showText = false;
      showImage = false;
      hideText = true;
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 111, 0),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Fire Scan',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Center(
            child: Container(
              height: 550,
              width: 400,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      visible: showText,
                      child: const Text(
                        'เลือกรูปภาพของคุณ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Visibility(
                      visible: hideText,
                      child: const Text(
                        'ผลคือ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Visibility(
                    visible: showImage,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/camera.png',
                          height: 100,
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  Center(
                    //predict
                    child: _loading == true
                        ? null //show nothing if no picture selected
                        : Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.5,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),

                              // ignore: unnecessary_null_comparison
                              _loading == false
                                  ? Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(30),
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: _output[0]['label'] == 'Fire'
                                                ? Colors.green[700]
                                                : Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            "$predictText $_confidence %",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                  ),

                  //predict
                  Column(
                    //image picker
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 160,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(15), //symmetric(
                          //     horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 254, 106, 0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.camera_alt_rounded,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'ถ่ายรูปภาพ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: pickGalleryImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 160,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(15), //symmetric(
                          //     horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 254, 106, 0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.photo_library,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'เลือกจากแกลเลอรี',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ), //image picker
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

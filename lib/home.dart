import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';


import 'camera.dart';
import 'bndbox.dart';

const String mobilenet = "MobileNet";
class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _recognitions;
 
  String _model = "";

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String res;
    res = await Tflite.loadModel(
            model: "assets/model_unquant.tflite",
            labels: "assets/labels.txt");
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body:_model==""?
      Container()
       :Stack(
              children: [
                Camera(
                  widget.cameras,
                  _model,
                  setRecognitions,
                ),
                BndBox(
                    _recognitions == null ? [] : _recognitions,
                   
                    screen.height,
                    screen.width,
                    ),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton:_model==""?
             FloatingActionButton(
              onPressed: ()=>onSelect(mobilenet),
              child: Icon(Icons.play_arrow),
              )
              :FloatingActionButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, 'reply');
              },
              child: Icon(Icons.pause),
              ),
    );
  }
}

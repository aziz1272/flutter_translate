import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_translate/ui/pages/text%20recognation%20page/translate%20recognation%20page/translate_text_recognation.dart';
import 'package:flutter_translate/ui/widgets/floating_action_button_page.dart';
import 'package:flutter_translate/ui/widgets/widget_colors.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class CheckingPage extends StatefulWidget {
  const CheckingPage({super.key});

  @override
  State<CheckingPage> createState() => _CheckingPageState();
}

class _CheckingPageState extends State<CheckingPage> {
  String getImageFile = "";
  String outImageText = "";

  getImage() async {
    final imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        getImageFile = imageFile.path;
      });
    }
    getRecognisedText(imageFile!);
  }

  getCameraImage() async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      setState(() {
        getImageFile = imageFile.path;
      });
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    String recogText = "";
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        recogText = recogText + line.text + " ";
      }
    }
    setState(() {
      outImageText = recogText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            backgroundColor: WidgetColors.specialDark,
            child: IconButton(
              onPressed: () {
                getImage();
              },
              icon: Icon(
                Icons.image,
                color: WidgetColors.whiteColor,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: WidgetColors.specialDark,
            child: IconButton(
              onPressed: () {
                getCameraImage();
              },
              icon: Icon(
                Icons.camera_alt,
                color: WidgetColors.whiteColor,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: getImageFile != ""
            ? ListView(
                children: [
                  Image(image: FileImage(File(getImageFile))),
                  const SizedBox(
                    height: 10,
                  )
                ],
              )
            : Center(
                child: Text(
                  "Select a picture",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: WidgetColors.specialLight,
                  ),
                ),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TextRecognation(inputRecognationText: outImageText)),
              );
            },
            child: FloatingActionButtonPage(text: 'Text recognation'),
          ),
        ],
      ),
    );
  }
}

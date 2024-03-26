import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final translator = GoogleTranslator();
  TextEditingController inputText = TextEditingController();
  var translatedText;

  translate() async {
    await translator
        .translate(inputText.text, from: 'uz', to: 'ru')
        .then((outputText) {
      translatedText = outputText.toString();
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translate"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: inputText,
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(onPressed: () {
            translate();
          }, child: Text("Translate to")),
          SizedBox(
            height: 20,
          ),
          Text(
            translatedText==null? "":translatedText,
            style: TextStyle(fontSize: 29),
          ),
        ],
      ),
    );
  }
}

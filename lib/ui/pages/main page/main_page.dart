import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/ui/pages/language%20controller/language_controller_page.dart';
import 'package:translator/translator.dart';
import '../translate_page/translate_page.dart';

class MainPage extends ConsumerWidget {
  static const String id = "main_page";

  final int index;

  MainPage({required this.index, super.key});

  final translator = GoogleTranslator();
  TextEditingController inputText = TextEditingController();
  String str = "";
  List lst = [];

  translate(WidgetRef ref, String text) {
    if (text == "") {
      ref.watch(trWordProvider.notifier).state = "";
    }
    translator
        .translate(inputText.text.trim(),
            from: ref.watch(inpListProvider.notifier).state.isEmpty
                ? 'uz'
                : ref.watch(inpListProvider.notifier).state[1],
            to: ref.watch(outListProvider.notifier).state.isEmpty
                ? 'en'
                : ref.watch(outListProvider.notifier).state[1])
        .then((outputText) {
      ref.watch(trWordProvider.notifier).state = outputText.toString();
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                left: size.width * 0.03,
                right: size.width * 0.01,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Color(0xffc5cae9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: size.height * 0.007,
                                left: size.width * 0.02,
                                bottom: size.width * 0.02,
                              ),
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                    ref.watch(inpListProvider.notifier).state.isEmpty
                                        ? "Uzbekistan"
                                        : ref.watch(inpListProvider.notifier)
                                            .state[0],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.height*0.016,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                  )),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LanguageControllerPage(
                                    tr: 1),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.02, right: size.width*0.01),
                          child: const Icon(Icons.translate),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                left: 10,
                                right: size.width*0.02,
                              ),
                              margin:  EdgeInsets.only(left: 7, bottom: 7, top: 7, right: size.width*0.02,),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                    ref.watch(outListProvider.notifier).state.isEmpty
                                        ? "English"
                                        : ref
                                            .watch(outListProvider.notifier)
                                            .state[0],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.height*0.016,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                  )),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LanguageControllerPage(
                                    tr: 2,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: size.height * 0.87,
              width: size.width,
              child: ListView(
                children: [
                  TextField(
                    controller: inputText,
                    onChanged: (String text) {
                      translate(ref, text);
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the text",
                        hintStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        )),
                    maxLines: 22,
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          translate(ref, inputText.text.trim().toString());

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TranslatePage(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          height: size.height * 0.06,
          decoration: BoxDecoration(
              color: Color(0xff5c6bc0),
              borderRadius: BorderRadius.circular(16)),
          child: const Center(
            child: Text(
              "Translate",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final inpListProvider = StateProvider<List>((ref) => []);
final outListProvider = StateProvider<List>((ref) => []);
final trWordProvider = StateProvider<String>((ref) => "");

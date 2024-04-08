import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/ui/pages/main%20page/input_language.dart';
import 'package:flutter_translate/ui/pages/main%20page/output_language.dart';
import 'package:flutter_translate/ui/widgets/widget_colors.dart';
import 'package:translator/translator.dart';
import '../../widgets/floating_action_button_page.dart';
import '../public variables/public_variables.dart';
import '../text recognation page/text recognation/text_recognation.dart';
import '../translate_page/translate_page.dart';

class MainPage extends ConsumerWidget {
  final int index;

  MainPage({required this.index, super.key});

  final translator = GoogleTranslator();
  TextEditingController inputText = TextEditingController();

  translate(WidgetRef ref, String text) {
    ref.watch(inputWordProvider.notifier).state = inputText.text;
    if (text == "") {
      ref.watch(trWordProvider.notifier).state = "";
    }
    translator
        .translate(ref.watch(inputWordProvider.notifier).state.trim(),
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
                      color:  WidgetColors.specialLight,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const InputLanguage(),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.02,
                              right: size.width * 0.01),
                          child: const Icon(Icons.translate),
                        ),
                        const OutputLanguage(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CheckingPage(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: WidgetColors.whiteColor,
                            radius: size.height * 0.02,
                            child: const Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 9,
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: size.height * 0.8,
              width: size.width,
              child: Column(
                children: [
                  TextField(
                    controller: inputText,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the text",
                        hintStyle: TextStyle(
                          fontSize: 24,
                          color: WidgetColors.greyColor,
                        )),
                    maxLines: 20,
                    style: TextStyle(
                      fontSize: 19,
                      color: WidgetColors.black87Color,
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              translate(ref, inputText.text.trim());
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TranslatePage(),
                  ),
                );
              });
            },
            child: FloatingActionButtonPage(text: 'Translate',),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/ui/pages/text%20recognation%20page/translate%20recognation%20page/inp_out_language.dart';
import 'package:flutter_translate/ui/pages/translate_page/translate_page.dart';
import 'package:flutter_translate/ui/widgets/floating_action_button_page.dart';
import 'package:flutter_translate/ui/widgets/widget_colors.dart';
import 'package:translator/translator.dart';
import '../../public variables/public_variables.dart';

class TextRecognation extends ConsumerWidget {
  String inputRecognationText;

  TextRecognation({required this.inputRecognationText, super.key});

  final translator = GoogleTranslator();

  translate(WidgetRef ref) {
    ref.watch(inputWordProvider.notifier).state = inputRecognationText;
    ref.watch(trWordProvider.notifier).state = "";
    translator
        .translate(inputRecognationText,
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

  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
            child: const InpOutLanguagePage(),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: size.height * 0.8,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SelectableText(
                    inputRecognationText,
                    style: TextStyle(
                        color: WidgetColors.blackColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              translate(ref);
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TranslatePage()));
              });
            },
            child: FloatingActionButtonPage(text: 'Translate'),
          ),
        ],
      ),
    );
  }
}

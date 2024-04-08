import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/ui/widgets/widget_colors.dart';
import '../language controller/language_controller_page.dart';
import '../public variables/public_variables.dart';

class InputLanguage extends ConsumerWidget {
  const InputLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
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
            color: WidgetColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                    ref
                        .watch(inpListProvider.notifier)
                        .state
                        .isEmpty
                        ? "Uzbekistan"
                        : ref
                        .watch(inpListProvider.notifier)
                        .state[0],
                    style: TextStyle(
                      color: WidgetColors.blackColor,
                      fontSize: size.height * 0.016,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                  )),
              const SizedBox(
                width: 4,
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
              const LanguageControllerPage(tr: 1),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/ui/widgets/widget_colors.dart';
import '../../public variables/public_variables.dart';
import '../text recognation/text_recognation.dart';

class InpOutLanguagePage extends ConsumerWidget {
  const InpOutLanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
            child: Container(
              height: size.height * 0.06,
              decoration: BoxDecoration(
                color: WidgetColors.specialLight,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 9,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckingPage()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: WidgetColors.whiteColor,
                      radius: size.height * 0.02,
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.02, right: size.width * 0.01),
                    child: const Icon(Icons.translate),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: 10,
                        right: size.width * 0.02,
                      ),
                      margin: EdgeInsets.only(
                        left: 7,
                        bottom: 7,
                        top: 7,
                        right: size.width * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: WidgetColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                                ref
                                    .watch(outListProvider.notifier)
                                    .state
                                    .isEmpty
                                    ? "English"
                                    : ref
                                    .watch(outListProvider.notifier)
                                    .state[0],
                                style: TextStyle(
                                  color: WidgetColors.blackColor,
                                  fontSize: size.height * 0.016,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

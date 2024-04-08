import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/ui/widgets/widget_colors.dart';
import '../public variables/public_variables.dart';

class TranslatePage extends ConsumerWidget {
  static const String id = "translate_page";

  const TranslatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              ref.watch(outListProvider.notifier).state.isEmpty
                  ? "English translation"
                  : "${ref.watch(outListProvider.notifier).state[0]} translation",
              style: TextStyle(
                color: WidgetColors.blackColor,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ))),
      body: Container(
        padding: const EdgeInsets.all(15),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                ref.watch(inputWordProvider.notifier).state,
                style: TextStyle(
                  color: WidgetColors.blackColor,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Divider(color: WidgetColors.specialLight,),
              ),

              SelectableText(
                ref.watch(trWordProvider.notifier).state,
                style: TextStyle(
                  color: WidgetColors.specialDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

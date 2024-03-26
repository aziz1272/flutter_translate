import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/ui/pages/main%20page/main_page.dart';

class TranslatePage extends ConsumerWidget {
  static const String id = "translate_page";

  const TranslatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: SelectableText(
          autofocus: true,
            ref.watch(outListProvider.notifier).state.isEmpty
            ? "English translation"
            : "${ref.watch(outListProvider.notifier).state[0]} translation"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        height: double.infinity,
        width: double.infinity,
        child: Text(
          ref.watch(trWordProvider.notifier).state,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}

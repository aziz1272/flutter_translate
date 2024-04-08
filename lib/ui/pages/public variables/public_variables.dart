import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PublicVariables extends ConsumerWidget {
  const PublicVariables({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}
final inpListProvider = StateProvider<List>((ref) => []);
final outListProvider = StateProvider<List>((ref) => []);
final trWordProvider = StateProvider<String>((ref) => "");
final inputWordProvider = StateProvider<String>((ref) => "");
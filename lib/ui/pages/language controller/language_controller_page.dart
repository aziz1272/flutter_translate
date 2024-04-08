import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/repository/services/service_lang.dart';
import 'package:flutter_translate/ui/pages/main%20page/main_page.dart';
import '../public variables/public_variables.dart';

class LanguageControllerPage extends ConsumerWidget {
  final int tr;
   const LanguageControllerPage({
     required this.tr,
     super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a language"),
      ),
      body: ListView.builder(
        itemCount: langList.length,
          itemBuilder: (
          BuildContext context, int index){
          List lst = langList[index];
          return ListTile(
            title: Text("${lst[0]} (${lst[1]})"),
            onTap: (){
              if(tr == 1) {
                ref.watch(inpListProvider.notifier).state = lst;
              } else if(tr == 2 ) {
                ref.watch(outListProvider.notifier).state = lst;
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainPage(index:tr,),
                ),
              );
            },
          );
      }),
    );
  }
}

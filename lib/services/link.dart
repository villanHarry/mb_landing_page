import 'dart:developer';
import 'dart:js' as js;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tadbir_landing_page/main.dart';

class LinkAPI {
  static Future<void> getLink() async {
    try {
      loadingProgressIndicator();
      final CollectionReference link =
          FirebaseFirestore.instance.collection('link');
      final val = await link.doc('download').get();
      Navigator.pop(navigatorKey.currentContext!);
      final url = val.data()! as Map<String, dynamic>;
      js.context.callMethod('open', [url["link"] as String]);
    } catch (e) {
      log("Error editing user data: $e");
    }
  }

  void ss() {}

  static Future<void> loadingProgressIndicator({double? value}) {
    return showDialog<void>(
      barrierDismissible: false,
      barrierColor: Color.fromARGB(255, 0, 0, 143).withOpacity(.5),
      builder: (ctx) {
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: Color(0xff57BA00),
            value: value,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
      context: navigatorKey.currentContext!,
    );
  }
}

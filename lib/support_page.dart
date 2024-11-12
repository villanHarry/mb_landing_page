import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:tadbir_landing_page/main.dart';
import 'package:tadbir_landing_page/services/app_route_name.dart';
import 'package:tadbir_landing_page/values/values.dart';
import 'package:tadbir_landing_page/widgets/app_validators.dart';
import 'package:tadbir_landing_page/widgets/custom_input_field.dart';
import 'package:tadbir_landing_page/widgets/navbar.dart';
import 'package:tadbir_landing_page/widgets/sections/footer.dart';

class SupportPage extends StatefulWidget {
  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final emailController = TextEditingController();
  final msgController = TextEditingController();
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.black,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72.0),
        child: SizedBox(width: size.width, child: const NavBar()),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 90),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: .14 * (size.width)),
              child: Form(
                key: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Help", style: textTheme.headline3),
                    const SizedBox(height: 20),
                    Text(
                        "For help/Support for any queries, You can submit a support request by filling the form given below:",
                        textAlign: TextAlign.left,
                        style: textTheme.bodyText1),
                    const SizedBox(height: 20),
                    CustomInputField(
                      hint: "Enter your Email Address",
                      controller: emailController,
                      maxCharacters: 35,
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.nextFocus();
                      },
                      validator: (value) => value?.validateEmail,
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      hint: "Enter your Message here...",
                      controller: msgController,
                      maxCharacters: 255,
                      maxLines: 10,
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.nextFocus();
                      },
                      validator: (value) =>
                          value?.validateEmpty("Message can't be empty"),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () async {
                        if (form.currentState?.validate() ?? false) {
                          loadingProgressIndicator();
                          final val = await submitSupport(
                              email: emailController.text,
                              message: msgController.text);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: AppColors.white,
                        backgroundColor: Color(0xff57BA00),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(
                            'Submit',
                            style: textTheme.subtitle2?.copyWith(
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "For Further queries you can contact:",
                      textAlign: TextAlign.center,
                      style: textTheme.bodyText1,
                    ),
                    const SizedBox(height: 5),
                    Text("Email: mybackyardtx@gmail.com",
                        style: textTheme.bodyText1),
                    Text("Contact No: +1 (716) 997-4674",
                        style: textTheme.bodyText1),
                  ],
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

Future<bool> submitSupport({String? email, String? message}) async {
  try {
    final request = MultipartRequest("POST",
        Uri.parse('https://admin.mybackyardusa.com/public/api/support'));
    request.fields.addAll({"email": email ?? "", "message": message ?? ""});
    request.headers.addAll({'Accept': 'application/json'});
    final response = await request.send().timeout(
      const Duration(seconds: 20),
      onTimeout: () {
        showMessage(message: "Network Error");
        throw TimeoutException;
      },
    );
    final res = await Response.fromStream(response);
    final model = json.decode(res.body);

    showMessage(message: model["message"]);
    if (res.statusCode == 200) {
      return true;
    }
  } catch (e) {
    showMessage(message: e.toString(), toast: Toast.LENGTH_LONG);
  }
  return false;
}

void loadingProgressIndicator({double? value}) {
  showDialog(
    barrierDismissible: false,
    barrierColor: const Color(0XFF22093C).withOpacity(.5),
    builder: (ctx) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          backgroundColor: Theme.of(ctx).primaryColor,
          value: value,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    },
    context: navigatorKey.currentContext!,
  );
}

void showMessage({String? message, Toast? toast}) {
  Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: toast ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}

import 'package:flutter/material.dart';
import 'package:tadbir_landing_page/values/values.dart';
import 'package:tadbir_landing_page/widgets/navbar.dart';
import 'package:tadbir_landing_page/widgets/sections/footer.dart';

class ErrorPage extends StatefulWidget {
  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
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
      body: Column(
        children: [
          const Spacer(),
          Text('404', style: textTheme.headline2),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Page Not Found",
              textAlign: TextAlign.center,
              style: textTheme.bodyText1,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

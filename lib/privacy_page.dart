import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:tadbir_landing_page/values/values.dart';
import 'package:tadbir_landing_page/widgets/navbar.dart';
import 'package:tadbir_landing_page/widgets/sections/footer.dart';

class PrivacyPage extends StatefulWidget {
  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool last = false;

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
          Expanded(
              child: SfPdfViewer.asset(
            "assets/files/privacy.pdf",
            onPageChanged: (val) {
              if (val.isLastPage) {
                setState(() {
                  last = true;
                });
              } else {
                setState(() {
                  last = false;
                });
              }
            },
          )),
          if (last) const Footer()
        ],
      ),
    );
  }
}

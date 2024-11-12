import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:tadbir_landing_page/values/values.dart';
import 'package:tadbir_landing_page/widgets/navbar.dart';
import 'package:tadbir_landing_page/widgets/sections/footer.dart';

class TermsPage extends StatefulWidget {
  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
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
            "assets/files/terms.pdf",
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

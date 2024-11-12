import 'package:flutter/material.dart';
import 'package:tadbir_landing_page/values/values.dart';
import 'package:tadbir_landing_page/widgets/navbar.dart';
import 'package:tadbir_landing_page/widgets/sections/cta.dart';
import 'package:tadbir_landing_page/widgets/sections/features.dart';
import 'package:tadbir_landing_page/widgets/sections/footer.dart';
import 'package:tadbir_landing_page/widgets/sections/heros.dart';
import 'package:tadbir_landing_page/widgets/sections/singles.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final textTheme = Theme.of(context).textTheme;

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
            homeBody(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget homeBody() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Heros(),
        // LogosList(),
        Features(),
        // Testimonials(),
        // Stats(),
        Single5(),
        Single6(),
        Cta(),
      ],
    );
  }
}

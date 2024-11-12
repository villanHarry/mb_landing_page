import 'package:flutter/material.dart';
import 'package:tadbir_landing_page/app_theme.dart';
import 'package:tadbir_landing_page/values/values.dart';

class Single5 extends StatelessWidget {
  const Single5({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 64,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              width: size.width * 0.25,
              height: size.height / 2,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 30,
                    left: (size.width * 0.25) * 0.06,
                    child: Image.asset(ImagePath.phoneMockup2),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 30),
          SizedBox(
            width: size.width / 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About the app', style: textTheme.headline3),
                const SizedBox(height: 30),
                Text(
                  "Transforming Local Shopping with My Backyard\n" +
                      "My Backyard bridges the gap between local businesses and the community, offering a seamless way to discover, access, and redeem exciting discounts. Whether you're shopping at your neighborhood café or a nearby boutique, this app brings exclusive deals right to your fingertips.",
                  style: lead1,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('About',
                          style: largeLabel.copyWith(
                              color: const Color(0xff57BA00))),
                      const SizedBox(width: 8),
                      Image.asset(
                        ImagePath.arrowRightIcon,
                        color: const Color(0xff57BA00),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Single6 extends StatelessWidget {
  const Single6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final singleWidth = size.width * 0.7;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      child: SizedBox(
        width: singleWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: singleWidth * 0.4,
                  child: Text('Why Choose "My Backyard"?',
                      style: textTheme.headline3),
                ),
                SizedBox(
                  width: singleWidth * 0.5,
                  child: Text(
                    "Support Local Commerce: Help build a vibrant community by shopping locally.\n" +
                        "Exclusive Offers: Get deals you won’t find anywhere else.\n" +
                        "Easy to Use: Intuitive design for both users and businesses.",
                    style: lead2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Flexible(
              child: SizedBox(
                width: singleWidth,
                height: 400,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(ImagePath.coverImg),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

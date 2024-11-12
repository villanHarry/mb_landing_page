import 'package:flutter/material.dart';
import 'package:tadbir_landing_page/responsive.dart';
import 'package:tadbir_landing_page/services/link.dart';
import 'package:tadbir_landing_page/values/values.dart';
import 'package:tadbir_landing_page/widgets/navbar.dart';

class Heros extends StatelessWidget {
  const Heros({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(
          //     ImagePath.background,
          //   ),
          //   fit: BoxFit.cover,
          // ),
          ),
      child: Column(
        children: [
          const SizedBox(height: 90),
          SizedBox(
            width: size.width * 0.7,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 2, child: _buildContent(textTheme)),
                Flexible(
                    child: Responsive(
                        mobile: Image.asset(
                          ImagePath.phoneMockup,
                          height: 400,
                        ),
                        desktop: Image.asset(
                          ImagePath.phoneMockup3,
                          height: 400,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildContent(TextTheme textTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 90),
        Responsive(
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Best Offers', style: textTheme.headline2),
              // const SizedBox(height: 5),
              Text('Wihtin Your Reach.', style: textTheme.headline2),
            ],
          ),
          desktop: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Best Offers', style: textTheme.headline1),
              // const SizedBox(height: 30),
              Text('Wihtin Your Reach.', style: textTheme.headline1),
            ],
          ),
        ),
        const SizedBox(height: 50),
        const Flexible(child: ImageLinks()),
        // TextButton(
        //   onPressed: () {}, //LinkAPI.getLink,
        //   style: TextButton.styleFrom(
        //     primary: AppColors.white,
        //     backgroundColor: Color(0xff57BA00),
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 35,
        //       vertical: 18,
        //     ),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(6),
        //     ),
        //   ),
        //   child: Text(
        //     'Download',
        //     style: textTheme.subtitle2!
        //         .copyWith(color: AppColors.black, fontSize: 16),
        //   ),
        // )
        // TextButton(
        //   onPressed: () {},
        //   style: TextButton.styleFrom(
        //     primary: AppColors.white,
        //     backgroundColor: AppColors.purple,
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 32,
        //       vertical: 24,
        //     ),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(6),
        //     ),
        //   ),
        //   child: Text(
        //     'Get Started',
        //     style: textTheme.subtitle2!.copyWith(color: AppColors.white),
        //   ),
        // )
      ],
    );
  }
}

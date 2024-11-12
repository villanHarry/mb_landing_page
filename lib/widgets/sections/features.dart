import 'package:flutter/material.dart';
import 'package:tadbir_landing_page/app_theme.dart';
import 'package:tadbir_landing_page/values/values.dart';

class Features extends StatelessWidget {
  const Features({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 60),
            Text('Features for Users', style: textTheme.headline2),
            const SizedBox(height: 48),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FeatureItem(
                    width: size.width / 4,
                    icon: Image.asset(ImagePath.featureIcon1,
                        color: Color(0xff57BA00)),
                    title: 'Discover Local Deals',
                    description:
                        'Find businesses near you with geolocation-based listings.',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FeatureItem(
                    width: size.width / 4,
                    icon: Image.asset(ImagePath.featureIcon2,
                        color: Color(0xff57BA00)),
                    title: 'Advanced Search & Filters',
                    description:
                        'Easily sort offers by category, location, or type',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FeatureItem(
                    width: size.width / 4,
                    icon: Image.asset(ImagePath.featureIcon3,
                        color: Color(0xff57BA00)),
                    title: 'Redeem Discounts',
                    description:
                        'Use QR codes to redeem offers quickly and conveniently.',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FeatureItem(
                    width: size.width / 4,
                    icon: Image.asset(ImagePath.featureIcon4,
                        color: Color(0xff57BA00)),
                    title: 'Personalized Notifications',
                    description:
                        'Receive alerts about new deals and offers tailored to your preferences.',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FeatureItem(
                    width: size.width / 4,
                    icon: Image.asset(ImagePath.featureIcon5,
                        color: Color(0xff57BA00)),
                    title: 'Save Your Favorite Deals',
                    description:
                        'Bookmark the best offers to access them later with ease.',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FeatureItem(
                    width: size.width / 4,
                    icon: Image.asset(ImagePath.featureIcon6,
                        color: Color(0xff57BA00)),
                    title: 'Profile Management',
                    description:
                        'Create and customize your business profile to showcase your brand.',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ],
    );
  }
}

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.width,
    this.height,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final String description;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(height: 24),
          Text(title, style: textTheme.headline5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}

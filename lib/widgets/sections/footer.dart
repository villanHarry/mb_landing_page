import 'package:flutter/material.dart';
import 'package:tadbir_landing_page/services/app_route_name.dart';
import 'package:tadbir_landing_page/services/app_router.dart';
import 'package:tadbir_landing_page/values/values.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  static const lst = ['Home', 'Terms', 'Privacy', 'Help'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: AppColors.black,
      child: Center(
        child: SizedBox(
          width: size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 56),
            child: DefaultTextStyle.merge(
              style: textTheme.bodyText1!.copyWith(color: AppColors.white),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImagePath.logo, width: 100),
                  const SizedBox(width: 24),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.asset(ImagePath.logo, width: 100),
                      // const SizedBox(height: 24),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Download Now'),
                          // SizedBox(width: 24),
                          // Text('License'),
                        ],
                      ),
                      SizedBox(height: size.width < 600 ? 6 : 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < lst.length; i++)
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width < 600 ? 12 : 24),
                              child: GestureDetector(
                                onTap: () {
                                  if (getVal(route) != lst[i]) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      getRoute(lst[i]),
                                    );
                                  }
                                },
                                child: Text(
                                  lst[i],
                                  style: size.width < 600
                                      ? textTheme.bodyMedium
                                      : null,
                                ),
                              ),
                            ),
                          // Text('About'),
                          // SizedBox(width: 24),
                          // Text('Features'),
                          // SizedBox(width: 24),
                          // Text('Pricing'),
                          // SizedBox(width: 24),
                          // Text('Careers'),
                          // SizedBox(width: 24),
                          // Text('Help'),
                          // SizedBox(width: 24),
                          // Text('Privacy Policy'),
                        ],
                      ),
                      SizedBox(height: size.width < 600 ? 12 : 24),
                      Text(
                        '© 2024 My Backyard USA. All rights reserved',
                        style: textTheme.bodyText2!.copyWith(
                          color: AppColors.gray.shade300,
                          fontSize: size.width < 600
                              ? textTheme.bodySmall?.fontSize
                              : null,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Get the App',
                      //   style: textTheme.subtitle2!.copyWith(
                      //     color: AppColors.gray.shade300,
                      //   ),
                      // ),
                      // const SizedBox(height: 16),
                      // Image.asset(ImagePath.appStore),
                      // const SizedBox(height: 16),
                      // Image.asset(ImagePath.googlePlay),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getRoute(String val) {
    switch (val) {
      case "Home":
        return AppRouteName.HOMEPAGE_ROUTE;
      case "Terms":
        return AppRouteName.TERMS_ROUTE;
      case "Privacy":
        return AppRouteName.PRIVACY_ROUTE;
      case "Help":
        return AppRouteName.SUPPORT_ROUTE;
      default:
        return "";
    }
  }

  String getVal(String val) {
    switch (val) {
      case AppRouteName.HOMEPAGE_ROUTE:
        return "Home";
      case AppRouteName.TERMS_ROUTE:
        return "Terms";
      case AppRouteName.PRIVACY_ROUTE:
        return "Privacy";
      case AppRouteName.SUPPORT_ROUTE:
        return "Help";
      default:
        return "";
    }
  }
}

import 'package:flutter/material.dart';
import 'package:tadbir_landing_page/main.dart';
import 'package:tadbir_landing_page/responsive.dart';
import 'package:tadbir_landing_page/services/app_route_name.dart';
import 'package:tadbir_landing_page/services/app_router.dart';
import 'package:tadbir_landing_page/values/values.dart';
import 'dart:js' as js;

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  static const lst = ['Home', 'Terms', 'Privacy', 'Help'];

  void login() {
    js.context.callMethod('open', ['https://tadbeer-app.web.app/']);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      height: 72.0,
      width: size.width,
      color: AppColors.black,
      padding: EdgeInsets.symmetric(
          horizontal: (size.width < 385) ? size.width * .12 : size.width * .15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    if (route != AppRouteName.HOMEPAGE_ROUTE) {
                      Navigator.pushReplacementNamed(
                          context, AppRouteName.HOMEPAGE_ROUTE);
                    }
                  },
                  child: const Logo(),
                ),
                if (size.width > 420)
                  SizedBox(width: (size.width >= 495) ? 30.0 : 15.0),
                if (size.width < 530)
                  PopupMenuButton<String>(
                    offset: const Offset(0, 40),
                    icon: const Icon(
                      Icons.expand_more,
                      size: 20.0,
                      color: AppColors.white,
                    ),
                    onSelected: (val) {
                      if (getVal(route) != val) {
                        Navigator.pushReplacementNamed(context, getRoute(val));
                      }
                    },
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xff57BA00),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    itemBuilder: (BuildContext context) {
                      return
                          //{'About', 'Products', 'Blog', 'Jobs'}
                          lst.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  )
                else
                  Flexible(child: _buildItems(textTheme, size)),
              ],
            ),
          ),
          // const Flexible(child: ImageLinks()),
          // Responsive(
          //     mobile: GestureDetector(
          //       onTap: login,
          //       child: Container(
          //         width: 120,
          //         height: 40,
          //         constraints: BoxConstraints(maxHeight: 40, maxWidth: 120),
          //         decoration: BoxDecoration(
          //           color: const Color(0xff57BA00),
          //           borderRadius: BorderRadius.circular(6),
          //         ),
          //         alignment: Alignment.center,
          //         child: Text(
          //           'Download the App',
          //           style: textTheme.subtitle2!
          //               .copyWith(color: AppColors.black, fontSize: 14),
          //         ),
          //       ),
          //     ),
          //     desktop: TextButton(
          //       onPressed: login,
          //       style: TextButton.styleFrom(
          //         primary: AppColors.white,
          //         backgroundColor: Color(0xff57BA00),
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 50,
          //           vertical: 18,
          //         ),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(6),
          //         ),
          //       ),
          //       child: Text(
          //         'Download the App',
          //         style: textTheme.subtitle2!
          //             .copyWith(color: AppColors.black, fontSize: 18),
          //       ),
          //     ))
        ],
      ),
    );
  }

  Widget _buildItems(TextTheme textTheme, Size _size) {
    return Responsive(
      mobile: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {
                  if (route != AppRouteName.HOMEPAGE_ROUTE) {
                    Navigator.pushReplacementNamed(navigatorKey.currentContext!,
                        AppRouteName.HOMEPAGE_ROUTE);
                  }
                },
                child: Text(lst[0], style: textTheme.bodyText2)),
            // Text('About', style: textTheme.bodyText2)
          ),
          if (_size.width >= 420) Flexible(child: _buildMore(textTheme)),
        ],
      ),
      desktop: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var item in lst)
            Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: InkWell(
                    onTap: () {
                      if (getVal(route) != item) {
                        Navigator.pushReplacementNamed(
                            navigatorKey.currentContext!, getRoute(item));
                      }
                    },
                    child: Text(item, style: textTheme.bodyText2))),
          // Text('About', style: textTheme.bodyText2),
          // const SizedBox(width: 20.0),
          // Text('Products', style: textTheme.bodyText2),
          // const SizedBox(width: 20.0),
          // Text('Blog', style: textTheme.bodyText2),
          // const SizedBox(width: 20.0),
          // Text('Jobs', style: textTheme.bodyText2),
          // const SizedBox(width: 20.0),
          // Flexible(child: _buildMore(textTheme)),
        ],
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

  Widget _buildMore(TextTheme textTheme) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 40),
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('More', style: textTheme.bodyText2),
          const Padding(
            padding: EdgeInsets.only(bottom: 4.0, left: 5),
            child: Icon(
              Icons.expand_more,
              size: 20.0,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      onSelected: (val) {
        if (getVal(route) != val) {
          Navigator.pushReplacementNamed(
              navigatorKey.currentContext!, getRoute(val));
        }
      },
      color: Colors.black,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xff57BA00),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (BuildContext context) {
        return
            // {'Products', 'Blog', 'Jobs'}
            lst.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}

class ImageLinks extends StatelessWidget {
  const ImageLinks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return (size.width < 630)
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImagePath.googlePlay),
              const SizedBox(height: 12.0),
              Image.asset(ImagePath.appStore),
            ],
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImagePath.googlePlay),
              const SizedBox(width: 12.0),
              Image.asset(ImagePath.appStore),
            ],
          );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final size = MediaQuery.of(context).size;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          ImagePath.logo,
          width: 80,
        ),
      ],
    );
  }
}

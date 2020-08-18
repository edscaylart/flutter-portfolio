import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scaylart_dev/constants.dart';
import 'package:scaylart_dev/widgets/mobile_desktop_view_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      desktopView: FooterDesktopView(),
      mobileView: FooterMobileView(),
    );
  }
}

class FooterDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
      height: 60,
      width: kInitWidth,
      padding: kScreenPadding,
      color: const Color(0xFF383a50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '@ Edson Souza $currentYear -- ',
            style: TextStyle(color: Colors.white),
          ),
          InkWell(
            child: Text(
              'Made with Flutter ❤️',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white,
              ),
            ),
            mouseCursor: MaterialStateMouseCursor.clickable,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () => launch('https://github.com'),
          ),
        ],
      ),
    );
  }
}

class FooterMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
      padding: kScreenPadding,
      height: 85,
      width: kInitWidth,
      color: const Color(0xFF383a50),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            '@ Edson Souza $currentYear',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 5),
          InkWell(
            child: Text(
              'Made with Flutter ❤️',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white,
              ),
            ),
            mouseCursor: MaterialStateMouseCursor.clickable,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () => launch('https://github.com'),
          ),
        ],
      ),
    );
  }
}

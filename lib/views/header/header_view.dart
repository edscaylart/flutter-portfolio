import 'package:flutter/material.dart';
import 'package:scaylart_dev/constants.dart';
import 'package:scaylart_dev/views/header/header_body.dart';
import 'package:scaylart_dev/widgets/mobile_desktop_view_builder.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: HeaderMobileView(),
      desktopView: HeaderDesktopView(),
    );
  }
}

class HeaderDesktopView extends StatelessWidget {
  const HeaderDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 950;
    final imageWidth = width * 0.47;
    return Container(
      height: 564,
      width: kInitWidth,
      color: const Color(0xFF383a50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(child: HeaderBody()),
          ],
        ),
      ),
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.5,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: const Color(0xFF383a50),
      child: Column(
        children: [
          HeaderBody(isMobile: true),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scaylart_dev/constants.dart';
import 'package:provider/provider.dart';
import 'package:scaylart_dev/screens/home_page_screen.dart';
import 'package:scaylart_dev/widgets/mobile_desktop_view_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: NavigationMobileView(),
      desktopView: NavigationDesktopView(),
    );
  }
}

class NavigationDesktopView extends StatelessWidget {
  const NavigationDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = context.watch<ScrollController>();
    final navigationItems = context.watch<List<NavigationItem>>();

    return Container(
      color: const Color(0xFF2a2c46),
      height: 50,
      width: 1507,
      padding: kScreenPadding,
      child: Row(
        children: [
          NavigationLogo(),
          Spacer(),
          for (var item in navigationItems)
            NavigationBarItem(
              onPressed: () {
                scrollController.animateTo(
                  item.position,
                  duration: Duration(microseconds: 700),
                  curve: Curves.easeInOut,
                );
              },
              text: item.text,
            ),
        ],
      ),
    );
  }
}

class NavigationMobileView extends StatelessWidget {
  const NavigationMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2a2c46),
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(width: 20),
          NavigationLogo(),
          Spacer(),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          )
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 64),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class NavigationLogo extends StatelessWidget {
  const NavigationLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => launch('#'),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage('https://github.com/edscaylart.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

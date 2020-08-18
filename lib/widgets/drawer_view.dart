import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaylart_dev/screens/home_page_screen.dart';
import 'package:scaylart_dev/widgets/mobile_desktop_view_builder.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      desktopView: SizedBox(),
      mobileView: DrawerMobileView(),
    );
  }
}

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Container(
                  width: 86,
                  height: 86,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('https://github.com/edscaylart.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  'Edson Souza',
                  style: GoogleFonts.titilliumWeb(
                    fontSize: 16,
                    color: Colors.white,
                    letterSpacing: 5.0,
                  ),
                ),
                Text(
                  'Web & Mobile Developer',
                  style: GoogleFonts.titilliumWeb(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF383a50),
            ),
          ),
          for (var item in navigationItems)
            ListTile(
              title: Text(item.text),
              onTap: () {
                scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                );
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}

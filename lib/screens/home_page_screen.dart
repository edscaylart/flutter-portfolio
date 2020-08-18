import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaylart_dev/views/about/about_view.dart';
import 'package:scaylart_dev/views/experience/experience_view.dart';
import 'package:scaylart_dev/views/footer_view.dart';
import 'package:scaylart_dev/views/header/header_view.dart';
import 'package:scaylart_dev/views/navigation_bar_view.dart';
import 'package:scaylart_dev/widgets/drawer_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  List<NavigationItem> navigationItems = [];

  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      navigationItems = [
        NavigationItem('About', key: aboutKey),
        NavigationItem('Experience', key: experienceKey),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ProxyProvider0<List<NavigationItem>>(update: (_, __) {
          return navigationItems;
        }),
        ChangeNotifierProvider<ScrollController>(create: (_) {
          return scrollController;
        }),
      ],
      child: Scaffold(
        endDrawer: DrawerView(),
        body: SizedBox(
          width: width,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                NavigationBarView(),
                HeaderView(),
                AboutView(key: aboutKey),
                ExperienceView(key: experienceKey),
                FooterView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationItem {
  final String text;
  final GlobalKey key;
  NavigationItem(this.text, {@required this.key});

  double get position => _getPosition(key);
}

double _getPosition(GlobalKey key) {
  final RenderBox renderBox = key.currentContext.findRenderObject();
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}

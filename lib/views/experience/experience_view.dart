import 'package:flutter/material.dart';
import 'package:scaylart_dev/widgets/mobile_desktop_view_builder.dart';

class ExperienceItem {
  final Icon icon;
  final String title;
  final String description;

  ExperienceItem({
    @required this.icon,
    @required this.title,
    @required this.description,
  });
}

final kExperienceItems = [
  ExperienceItem(
    icon: Icon(
      Icons.hourglass_full,
      color: Colors.white,
    ),
    title: 'Experience',
    description: 'ReactJs, React-native, NodeJS, Flutter',
  ),
  ExperienceItem(
    icon: Icon(
      Icons.flash_on,
      color: Colors.white,
    ),
    title: 'Skills',
    description: 'Front-End, Back-End & Mobile Development',
  ),
];

class ExperienceView extends StatelessWidget {
  const ExperienceView({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      desktopView: ExperienceDesktopView(),
      mobileView: ExperienceMobileView(),
    );
  }
}

class ExperienceDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final item in kExperienceItems)
            Container(
              child: Row(
                children: [
                  Container(
                    width: 64.0,
                    height: 64.0,
                    decoration: new BoxDecoration(
                      color: Color(0xFF878797),
                      shape: BoxShape.circle,
                    ),
                    child: item.icon,
                  ),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
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

class ExperienceMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          for (final item in kExperienceItems)
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 64.0,
                    height: 64.0,
                    decoration: new BoxDecoration(
                      color: Color(0xFF878797),
                      shape: BoxShape.circle,
                    ),
                    child: item.icon,
                  ),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaylart_dev/constants.dart';
import 'package:scaylart_dev/widgets/mobile_desktop_view_builder.dart';

class AboutView extends StatelessWidget {
  const AboutView({
    Key key,
  }) : super(key: key);
  static const title = 'About me';
  static const description =
      'I aspire to build experiences that are useful, pleasant, fun and meaningful. To me, good solutions come from deep empathy of the users, good understanding of the problem, constraints and business objectives, iterations closely with user feedback, and intentional decisions with solid reasoning';

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      desktopView: AboutDesktopView(description),
      mobileView: AboutMobileView(description),
    );
  }
}

class AboutDesktopView extends StatelessWidget {
  final String description;

  AboutDesktopView(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: kInitWidth,
      child: Row(
        children: [
          Expanded(
            child: DescriptionView(description: description),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              child: SizedBox(),
              decoration: BoxDecoration(
                color: const Color(0xFF1e1d34),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF1e1d34).withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                  image: AssetImage('images/rurouni-kenshin.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutMobileView extends StatelessWidget {
  final String description;

  AboutMobileView(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 568,
      width: kInitWidth,
      child: Column(
        children: [
          Expanded(
            child: DescriptionView(description: description),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              child: SizedBox(),
              decoration: BoxDecoration(
                color: const Color(0xFF1e1d34),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF1e1d34).withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                  image: AssetImage('images/rurouni-kenshin.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionView extends StatelessWidget {
  const DescriptionView({
    Key key,
    @required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About me',
            textAlign: TextAlign.center,
            style: GoogleFonts.titilliumWeb(
              fontSize: 26,
              letterSpacing: 5.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          AutoSizeText(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.titilliumWeb(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    Key key,
    this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText(
          'EDSON SOUZA',
          style: GoogleFonts.titilliumWeb(
            fontSize: 16,
            color: Colors.white,
            letterSpacing: 22.0,
          ),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
        // SizedBox(height: isMobile ?? false ? 20 : 37),
        Text(
          'WEB & MOBILE',
          style: GoogleFonts.titilliumWeb(
            fontSize: isMobile ?? false ? 50 : 70,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'DEVELOPER',
          style: GoogleFonts.titilliumWeb(
            fontSize: 70,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Divider(
          color: Colors.red,
          thickness: 4.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final social in socials)
              IconButton(
                icon: social.icon,
                onPressed: () => launch(social.url),
                color: Colors.redAccent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              )
          ],
        ),
      ],
    );
  }
}

class SocialInfo {
  final Widget icon;
  final String url;
  SocialInfo({
    @required this.icon,
    @required this.url,
  });
}

final socials = [
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.github),
      url: 'https://github.com/edscaylart'),
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.instagram),
      url: 'https://www.instagram.com/edson_fsouza'),
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.linkedin),
      url: 'https://www.linkedin.com/in/edson-souza-99205535'),
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.twitter),
      url: 'https://twitter.com/edscaylart'),
];

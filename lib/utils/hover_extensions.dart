import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:scaylart_dev/widgets/elevate_on_hover.dart';

extension HoverExtension on Widget {
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get moveUpOnHover {
    return ElevateOnHover(child: this);
  }
}

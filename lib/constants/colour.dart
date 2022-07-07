import 'dart:ui';
import 'package:flutter/material.dart';

class Shade{

  final Color darkShade;
  final Color lightShade;

  Shade(this.darkShade, this.lightShade);
}

const Color background = Color(0xFFFFFFFF);
Shade redGradient = Shade(Color(0xFFE25C5C), Color(0xFFEFEFEF));
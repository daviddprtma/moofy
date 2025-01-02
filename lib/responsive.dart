import 'package:flutter/material.dart';

class Responsive {
  const Responsive();

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 850 &&
      MediaQuery.of(context).size.width < 1100;

  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;
}

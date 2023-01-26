import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/dimensions.dart';
import '../../widget/bigText.dart';
import '../restaurants/AddFood.dart';
import '../restaurants/accueil.dart';
import '../restaurants/orders.dart';

class TabletteScaffold extends StatefulWidget {
  const TabletteScaffold({Key? key}) : super(key: key);

  @override
  State<TabletteScaffold> createState() => _TabletteScaffoldState();
}

class _TabletteScaffoldState extends State<TabletteScaffold> {

  @override
  Widget build(BuildContext context) {
    return Accueil();
  }
}

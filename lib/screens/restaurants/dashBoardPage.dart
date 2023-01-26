import 'package:dashboard/screens/responsive/desktop_scaffold.dart';
import 'package:dashboard/screens/responsive/mobile_scafffold.dart';
import 'package:dashboard/screens/responsive/tablette_scaffold.dart';
import 'package:dashboard/utils/responsive_Layout.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        MobileScaffold: MobileScaffold(),
        TabletteScaffold: TabletteScaffold(),
        DeskTopScaffold: DesktopScaffold(),
      )
    );
  }
}

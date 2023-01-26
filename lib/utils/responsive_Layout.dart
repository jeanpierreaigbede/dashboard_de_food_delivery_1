import 'package:flutter/material.dart';


class ResponsiveLayout extends StatelessWidget {
  final Widget MobileScaffold ;
  final Widget TabletteScaffold;
  final Widget DeskTopScaffold;
   ResponsiveLayout({Key? key,required this.MobileScaffold,required this.TabletteScaffold, required this.DeskTopScaffold}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,contrains){
      if(contrains.maxWidth < 500){
        return MobileScaffold;
      }else if(contrains.maxWidth <1100){
        return TabletteScaffold;
      }else{
        return DeskTopScaffold;
      }
    });
  }
}

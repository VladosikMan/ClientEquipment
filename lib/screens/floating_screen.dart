
import 'package:eqiup_client/screens/base_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class FloatingButtonScreen extends BaseScreen{
  const FloatingButtonScreen( {super.key, required super.title, required super.body,
  required this.floatingActionButton, this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat});

  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(

          screenTitle: title,
          showBackButton: showBackButton,
        ),
        body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation:  floatingActionButtonLocation,
    );
  }
}
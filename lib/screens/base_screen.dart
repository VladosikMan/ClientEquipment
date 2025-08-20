import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showBackButton;

  const BaseScreen({
    super.key,
    required this.title,
    required this.body,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(

        screenTitle: title,
        showBackButton: showBackButton,
      ),
      body: body,
    );
  }
}
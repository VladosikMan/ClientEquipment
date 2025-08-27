import 'package:eqiup_client/widgets/detail_card.dart';
import 'package:flutter/material.dart';

import '../data/details.dart';
import '../widgets/rounded_card.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Журнал')),
      body:DetailCard(detail: Detail(name: "sdfsf",date: 1212),)
    );
  }
}
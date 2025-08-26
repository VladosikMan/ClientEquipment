import 'package:eqiup_client/models/http/details_model.dart';
import 'package:eqiup_client/screens/base_screen.dart';
import 'package:eqiup_client/screens/fragments/detail_fragment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
   DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsModel(),
      child: BaseScreen(title: "База", body:  _detailTabController),
    );
  }
  final DefaultTabController _detailTabController = DefaultTabController(
    length: 3,
    child: Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.warehouse), text: 'Оборудование'),
            Tab(icon: Icon(Icons.group_work), text: 'Группы'),
            Tab(icon: Icon(Icons.cases), text: 'Места хранения'),
          ],
        ) ,
        backgroundColor: Colors.black87,

      ),
      body: const TabBarView(
        children: [
          Center(child: DetailsFragment()),
          Center(child: Text('Содержимое настроек')),
          Center(child: Text('Содержимое профиля')),
        ],
      ),
    ),
  );
}

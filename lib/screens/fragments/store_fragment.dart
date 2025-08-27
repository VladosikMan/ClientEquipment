import 'package:eqiup_client/data/list_notification.dart';
import 'package:eqiup_client/data/store.dart';
import 'package:eqiup_client/models/http/store_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/detail_card.dart';

class StoreFragment extends StatelessWidget {
  const StoreFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 1. Виджет фильтрации и сортировки
          FilterSection(/*onFilterChanged: applyFilter*/),

          // 2. Обновляемый список элементов
          Expanded(
            child: ControlledListView(
              // items: filteredItems,
              // onItemTap: (item) {
              //   print('Выбран элемент: $item');
              // },
            ),
          ),

          // 3. Панель управления
        //  ControlButtons(/*onAdd: addItem, onClear: clearItems*/),
        ],
      ),
    );
  }
}

// 1. Секция фильтрации
class FilterSection extends StatelessWidget {
  //final ValueChanged<String> onFilterChanged;

  const FilterSection({super.key /* required this.onFilterChanged}*/});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Фильтр',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

// 2. Контролируемый список
class ControlledListView extends StatelessWidget {
  // final List<String> items;
  // final ValueChanged<String> onItemTap;

  const ControlledListView({
    super.key,
    // required this.items,
    //   required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {


    return Consumer<StoreModel>(
      builder: (context, model, child) {
        return ListView.builder(

          scrollDirection: Axis.vertical,
          itemCount: model.stores.length,
          itemBuilder: (context, index) {
            final item = model.stores[index];
            return DetailCard(notif: ListNotification(header: item.name, dateHeader: item.date.toString(), information: item.address, tags: "tags"), deleteDetail: () {  /*model.deleteDetail(item.id!);*/}, );
          },
        );
      },
    );
  }
}
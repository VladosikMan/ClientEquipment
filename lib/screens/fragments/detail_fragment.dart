import 'package:eqiup_client/data/list_notification.dart';
import 'package:eqiup_client/models/http/details_model.dart';
import 'package:eqiup_client/widgets/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/details.dart';

class DetailsFragment extends StatelessWidget {
  const DetailsFragment({super.key});

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
          ControlButtons(/*onAdd: addItem, onClear: clearItems*/),
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
  const ControlledListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsModel>(
      builder: (context, model, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: model.details.length,
          itemBuilder: (context, index) {
            final item = model.details[index];
            return DetailCard(
              notif: ListNotification(header: item.name!, dateHeader: item.date.toString(), information: "information", tags: "tags"),
              deleteDetail: () {
                model.deleteDetail(item.id!);
              },
            );
          },
        );
      },
    );
  }
}

// 3. Секция управления
class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<DetailsModel>(
            builder: (context, model, child) {
              return ElevatedButton(
                onPressed: () => {model.getAllDetails()},
                child: const Text('Добавить'),
              );
            },
          ),
          Consumer<DetailsModel>(
            builder: (context, model, child) {
              return ElevatedButton(
                onPressed: () => {
                  model.createDetail(
                    Detail(
                      articleNumber: "123123",
                      name: "Колайдер",
                      status: 1,
                      date: 123213,
                      groupId: 7,
                      storeId: 7,
                    ),
                  ),
                },
                child: const Text('Очиситить'),
              );
            },
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Очистить')),
        ],
      ),
    );
  }
}

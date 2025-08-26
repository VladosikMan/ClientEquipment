import 'package:eqiup_client/widgets/detail_card.dart';
import 'package:flutter/material.dart';

import '../widgets/rounded_card.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Журнал')),
      body: RoundedCard(
        child: Stack(
          children: [
            // Основное содержимое карточки
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Левая часть (40%) с круглой иконкой
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                SizedBox(width: 16),
                // Правая часть (60%) с контентом
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Подшипник качения',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Последняя замена: 12.05.2023',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Расход: 2 шт/месяц',
                        style: TextStyle(fontSize: 14,
                        color: Colors.blueAccent),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '#вращающиеся #нагрузка',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Row(children: [
                        Chip(
                          label: Text(
                           "Подшинпнки",
                            style: TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Colors.blue[90],
                        ),
                        SizedBox(width: 8),
                        Chip(
                          label: Text(
                            "Шкаф №3",
                            style: TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Colors.deepPurpleAccent[90],
                        ),
                      ],)
                    ],
                  ),
                ),
              ],
            ),
            // Иконка корзины в правом верхнем углу
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () {
                  // Действие при нажатии на корзину
                  print('Удалить карточку');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:eqiup_client/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

import '../data/details.dart';
import '../data/list_notification.dart';

class DetailCard extends StatelessWidget {
  final ListNotification notif;

  final VoidCallback deleteDetail;

  const DetailCard({
    super.key,
    required this.notif,
    required this.deleteDetail,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: RoundedCard(
        child: Stack(
          children: [
            // Основное содержимое карточки
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Левая часть (40%) с круглой иконкой
                Container(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                SizedBox(width: 16),
                // Правая часть (60%) с контентом
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      notif.header,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      notif.dateHeader,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Расход: 2 шт/месяц',
                      style: TextStyle(fontSize: 14, color: Colors.blueAccent),
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
                    Row(
                      children: [
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
                      ],
                    ),
                  ],
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
                  deleteDetail();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

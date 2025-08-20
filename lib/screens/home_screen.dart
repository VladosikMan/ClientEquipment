// Экран авторизации
import 'package:eqiup_client/screens/base_screen.dart';
import 'package:eqiup_client/screens/floating_screen.dart';
import 'package:flutter/material.dart';

import '../navigation/app_route_delegate.dart';
import '../navigation/app_route_state.dart';
import '../widgets/animation_button.dart';
import '../widgets/round_icon.dart';

// Главный экран
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final delegate = AppRouterDelegate.of();
    return FloatingButtonScreen(
      title: "Главный экран",

      body:
      Padding(
        padding: const EdgeInsets.all(20.0), // Отступы от всех краев экрана)
         child:  Center(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40),
                buildRoundIcon(150, 150),
                SizedBox(height: 40),
                AnimatedButton(text: 'Кнопка 1', buttonColor: Colors.deepPurpleAccent,),
                SizedBox(height: 20),
                AnimatedButton(text: 'Кнопка 2', buttonColor: Colors.deepPurpleAccent),
                SizedBox(height: 20),
                AnimatedButton(text: 'Кнопка 3', buttonColor: Colors.deepPurpleAccent),
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(130))
        ,
        child: const Icon(Icons.qr_code, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

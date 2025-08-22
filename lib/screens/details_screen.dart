import 'dart:developer';
import 'package:eqiup_client/data/user.dart';
import 'package:eqiup_client/models/http/details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../http/http_client.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Детали')),
        body: Center(
          child: Column(
            children: [
              Consumer<DetailsModel>(
                builder: (context, model, child) {
                  return Text('Total price: ${model.length}');
                },
              ),

              Consumer<DetailsModel>(
                builder: (context, model, child) {
                  return   ElevatedButton(
                    onPressed: ()  {
                      model.getLengthDetails();
                      }
                    ,
                    child: const Text('Войти'),
                  );
                },
              )


            ],
          ),
        ),
      ),
    );
  }
}

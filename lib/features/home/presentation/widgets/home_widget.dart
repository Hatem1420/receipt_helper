import 'package:flutter/material.dart';
import 'package:receipt_helper/features/home/domain/entities/home_entity.dart';

class HomeWidget extends StatelessWidget {
  final HomeEntity? receipt;
  const HomeWidget({super.key, this.receipt});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: .antiAlias,
      child: Column(children: [
        Text('data')
      ]),
    );
  }
}

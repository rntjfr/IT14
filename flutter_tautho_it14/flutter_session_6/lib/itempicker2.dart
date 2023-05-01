import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPicker2 extends StatefulWidget {
  const ItemPicker2({super.key});

  @override
  State<ItemPicker2> createState() => _ItemPicker2State();
}

class _ItemPicker2State extends State<ItemPicker2> {
  final products = [
    'product 1',
    'product 2',
    'product 3',
    'product 4',
    'product 5',
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoPicker(
        itemExtent: 64,
        onSelectedItemChanged: (index) {},
        children: products
            .map(
              (
                item,
              ) =>
                  Center(
                child: Text(
                  item,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

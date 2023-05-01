import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPicker1 extends StatefulWidget {
  const ItemPicker1({super.key});

  @override
  State<ItemPicker1> createState() => _ItemPicker1State();
}

class _ItemPicker1State extends State<ItemPicker1> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoPicker(
        itemExtent: 64,
        onSelectedItemChanged: (index) {},
        children: [
          Center(child: Text('Item 1')),
          Center(child: Text('Item 2')),
          Center(child: Text('Item 3')),
          Center(child: Text('Item 4')),
        ],
      ),
    );
  }
}

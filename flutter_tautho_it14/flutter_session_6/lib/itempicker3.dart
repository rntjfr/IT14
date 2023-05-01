import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPicker3 extends StatefulWidget {
  const ItemPicker3({super.key});

  @override
  State<ItemPicker3> createState() => _ItemPicker3State();
}

class _ItemPicker3State extends State<ItemPicker3> {
  final products = [
    'product 1',
    'product 2',
    'product 3',
    'product 4',
    'product 5',
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Picker 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              products[index],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 350,
              child: CupertinoPicker(
                itemExtent: 64,
                onSelectedItemChanged: (selecteditem) {
                  setState(() {
                    this.index = selecteditem;
                    final item = products[index];
                    print('Selected item: $item');
                  });
                },
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
            ),
          ],
        ),
      ),
    );
  }
}

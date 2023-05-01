import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPickerDialog1 extends StatefulWidget {
  const ItemPickerDialog1({super.key});

  @override
  State<ItemPickerDialog1> createState() => _ItemPickerDialog1State();
}

class _ItemPickerDialog1State extends State<ItemPickerDialog1> {
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
        title: const Text('Item Picker Dialog 1'),
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
            const SizedBox(
              height: 24,
            ),
            CupertinoButton.filled(
              child: const Text('Open Picker'),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    actions: [buildpicker()],
                    cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  buildpicker() => SizedBox(
        height: 350,
        child: CupertinoPicker(
          looping: true,
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
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
              )
              .toList(),
        ),
      );
}

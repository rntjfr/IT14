import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPickerDialog2 extends StatefulWidget {
  const ItemPickerDialog2({super.key});

  @override
  State<ItemPickerDialog2> createState() => _ItemPickerDialog2State();
}

class _ItemPickerDialog2State extends State<ItemPickerDialog2> {
  late FixedExtentScrollController scrollcontroller;
  late TextEditingController textcontroller;
  final products = [
    'product 1',
    'product 2',
    'product 3',
    'product 4',
    'product 5',
  ];
  int index = 0;

  @override
  void initState() {
    super.initState();
    scrollcontroller = FixedExtentScrollController(
      initialItem: index,
    );

    textcontroller = TextEditingController(
      text: products[index],
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollcontroller.dispose();
    textcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Picker Dialog 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: CupertinoTextField(
                controller: textcontroller,
                readOnly: true,
                enableInteractiveSelection: false,
                textAlign: TextAlign.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
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
        child: StatefulBuilder(
          builder: (context, setState) => CupertinoPicker(
            looping: true,
            itemExtent: 64,
            selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
              background: CupertinoColors.activeBlue.withOpacity(0.2),
            ),
            onSelectedItemChanged: (index) {
              setState(
                () {
                  this.index = index;
                  final item = products[index];
                  print('Selected item: $item');
                  textcontroller.text = item;
                },
              );
            },
            children: List.generate(
              products.length,
              (index) {
                final isSelected = this.index == index;
                final item = products[index];
                final color = isSelected
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.black;

                return Center(
                  child: Text(
                    item,
                    style: TextStyle(color: color, fontSize: 32),
                  ),
                );
              },
            ),
          ),
        ),
      );
}

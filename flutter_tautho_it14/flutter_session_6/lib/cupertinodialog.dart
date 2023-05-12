import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDialog extends StatefulWidget {
  const CupertinoDialog({super.key});

  @override
  State<CupertinoDialog> createState() => _CupertinoDialogState();
}

class _CupertinoDialogState extends State<CupertinoDialog> {
  _showModalDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Question'),
        content: const Text('Are you sure you want to do this action?'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cupertino Modal Dialog'),
      ),
      body: Center(
        child: CupertinoButton.filled(
          onPressed: () {
            _showModalDialog(context);
          },
          child: const Text('Show modal'),
        ),
      ),
    );
  }
}

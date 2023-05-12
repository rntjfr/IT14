import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_6/model/itemlist.dart';

class ListTileSample1 extends StatefulWidget {
  const ListTileSample1({super.key});

  @override
  State<ListTileSample1> createState() => _ListTileSample1State();
}

class _ListTileSample1State extends State<ListTileSample1> with ItemList {
  _showModalDialog(BuildContext context, String newcontent, String type) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Question'),
        content: Text(newcontent),
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
              String msg = (type == 'edit')
                  ? 'You successfully edited the item!'
                  : 'You successfully deleted the item!';
              _showNormalDialog(context, msg, type);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  _showNormalDialog(BuildContext context, String newcontent, String type) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Success'),
        content: Text(newcontent),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Tile Sample 1'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: itemlist.length,
          itemBuilder: (BuildContext context, int index) {
            return buildList(context, itemlist, index);
          },
        ),
      ),
    );
  }

  buildList(BuildContext context, List itemlist, int index) => Card(
        child: ListTile(
          title: Text(itemlist[index]['itemname']),
          subtitle: Text(itemlist[index]['description']),
          leading: CircleAvatar(
            backgroundImage: AssetImage(itemlist[index]['image'].toString()),
            radius: 30,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('₱ ${itemlist[index]['price'].toString()}'),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 'view',
                      child: Text('View'),
                    ),
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ];
                },
                onSelected: (value) {
                  print('Selected menu item is $value');
                  setSelectedMenuItem(context, value.toString());
                },
              ),
            ],
          ),
        ),
      );

  setSelectedMenuItem(BuildContext context, String value) {
    if (value == 'view') {}
    if (value == 'edit') {
      _showModalDialog(
          context, 'Are you sure you want to edit this item?', 'edit');
    }
    if (value == 'delete') {
      _showModalDialog(
          context, 'Are you sure you want to delete this item?', 'delete');
    }
  }
}

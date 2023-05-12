import 'package:flutter/material.dart';

class ListTileSample extends StatefulWidget {
  const ListTileSample({super.key});

  @override
  State<ListTileSample> createState() => _ListTileSampleState();
}

class _ListTileSampleState extends State<ListTileSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Tile Sample'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('Item 1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 2'),
                leading: Icon(Icons.person),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 3'),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 4'),
                subtitle: Text('Subitem 4'),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 5'),
                subtitle: Text('Subitem 5'),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/products/photo_female_1.jpg'),
                  radius: 25,
                ),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 6'),
                subtitle: Text('Subitem 6'),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/products/photo_female_2.jpg'),
                  radius: 25,
                ),
                dense: true,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

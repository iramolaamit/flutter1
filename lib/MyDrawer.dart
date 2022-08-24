import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(shape: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
      backgroundColor: Colors.green,
      elevation: 22,
      semanticLabel: 'Drawer',
      width: 195,
      child: ListView(
        children: [
          Container(
            child: Image.network(
                'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
          ),
          ListTile(
            title: Text('First tille'),
            trailing: Text('Trailing'),
            leading: Icon(Icons.account_balance),
            style: ListTileStyle.drawer,
            enabled: true,
            subtitle: Text('Subtitle'),
            dense: true,
            selected: true,
            selectedColor: Colors.indigoAccent,
            onTap: () => Navigator.pop(context),
          ),
          Divider(),
          ListTile(
            onTap: () => Navigator.pop(context),
            title: Text('Second tille'),
            trailing: Text('Trailing'),
            leading: Icon(Icons.account_balance),
            style: ListTileStyle.drawer,
            enabled: true,
            subtitle: Text('Subtitle'),
            dense: true,
            selected: true,
            selectedColor: Colors.indigoAccent,
          ),
          Divider(),
          ListTile(
            onTap: () => Navigator.pop(context),
            title: Text('Third tille'),
            trailing: Text('Trailing'),
            leading: Icon(Icons.account_balance),
            style: ListTileStyle.drawer,
            enabled: true,
            subtitle: Text('Subtitle'),
            dense: true,
            selected: true,
            selectedColor: Colors.indigoAccent,
          ),
          Divider(),
          ListTile(
            onTap: () => Navigator.pop(context),
            title: Text('Fourth tille'),
            trailing: Text('Trailing'),
            leading: Icon(Icons.account_balance),
            style: ListTileStyle.drawer,
            enabled: true,
            subtitle: Text('Subtitle'),
            dense: true,
            selected: true,
            selectedColor: Colors.indigoAccent,
          ),
          Divider(),
          ListTile(
            onTap: () => Navigator.pop(context),
            title: Text('Fifth tille'),
            trailing: Text('Trailing'),
            leading: Icon(Icons.account_balance),
            style: ListTileStyle.drawer,
            enabled: true,
            subtitle: Text('Subtitle'),
            dense: true,
            selected: true,
            selectedColor: Colors.indigoAccent,
          ),
        ],
      ),);

  }
}

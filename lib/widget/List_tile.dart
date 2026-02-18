import 'package:flutter/material.dart';

class List_item extends StatelessWidget {
  const List_item({super.key, required this.title, required this.text});
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text("$title", maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text("$text", maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Icon(Icons.delete_forever),
      ),
    );
  }
}

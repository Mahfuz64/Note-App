import 'package:flutter/material.dart';
import 'package:mynote/database/Notesdata.dart';
import 'package:mynote/screen/notes.dart';

class Edit extends StatefulWidget {
  const Edit({super.key, required this.index});
  final int index;

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController title = TextEditingController();
  TextEditingController text = TextEditingController();
  assign_data() {
    title.text = info.notedata[widget.index]["title"];
    text.text = info.notedata[widget.index]["text"];
  }

  @override
  void initState() {
    assign_data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Edit Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          info.notedata[widget.index]["title"] = title.text;
          info.notedata[widget.index]["text"] = text.text;
          Navigator.pop(context);
        },
        child: Text("Save"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 10),
        child: Column(
          children: [
            TextField(
              style: TextStyle(fontSize: 24),
              maxLines: null,
              minLines: 1,
              controller: title,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(border: InputBorder.none),
            ),
            TextField(
              maxLines: null,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              controller: text,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ],
        ),
      ),
    );
  }
}

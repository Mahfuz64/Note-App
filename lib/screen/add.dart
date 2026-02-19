import 'package:flutter/material.dart';
import 'package:mynote/screen/notes.dart';
import 'package:mynote/database/Notesdata.dart';

class Addnote extends StatefulWidget {
  const Addnote({super.key});

  @override
  State<Addnote> createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  TextEditingController title = TextEditingController();
  TextEditingController text = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Edit Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          info.notedata.add({"title": title.text, "text": text.text});
          Navigator.pop(context);
        },
        child: Text("Save"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 10),
        child: Column(
          spacing: 10,
          children: [
            TextField(
              style: TextStyle(fontSize: 24),
              maxLines: null,
              minLines: 1,
              controller: title,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(hintText: "Title"),
            ),
            TextField(
              maxLines: null,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              controller: text,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(border: InputBorder.none,hintText: "Details"),
            ),
          ],
        ),
      ),
    );
  }
}

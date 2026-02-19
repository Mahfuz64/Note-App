import 'package:flutter/material.dart';
import 'package:mynote/database/Notesdata.dart';

class Trash extends StatefulWidget {
  const Trash({super.key});

  @override
  State<Trash> createState() => _TrashState();
}

class _TrashState extends State<Trash> {
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        centerTitle: true, title: Text("Trash File")),
        body:info.trash.isEmpty
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Center(child: Text("Empty Notes"))])
            : Column(
                children: [
                  SizedBox(height: 10),

                  TextField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffB2BEB5),
                      hintText: "Search Notes",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: info.trash.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(
                              info.trash[index]["title"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              info.trash[index]["text"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Confirmation"),
                                      content: Text(
                                        "Are Your sure to Permanently delete?",
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            info.trash.removeAt(index);
                                            setState(() {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text("Yes"),
                                        ),

                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("No"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },

                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mynote/database/Notesdata.dart';
import 'package:mynote/screen/LoginScreen.dart';
import 'package:mynote/widget/List_tile.dart';
import 'package:mynote/widget/alertwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mynote/database/Notesdata.dart';

class allnote extends StatefulWidget {
  const allnote({super.key});

  @override
  State<allnote> createState() => _allnoteState();
}

class _allnoteState extends State<allnote> {
  final note = info();
  void _showNoDataDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("No Data Found"),
        content: const Text("There is no note available."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (note.notedata.isEmpty) {
        _showNoDataDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Drawer(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.menu),
          ),
          title: Text("Notes"),
          actions: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Confirmation"),

                      actionsAlignment: MainAxisAlignment.end,
                      buttonPadding: EdgeInsets.all(40),
                      content: Text("Are You Sure to Logout?"),
                      actions: [
                        InkWell(
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.remove("islogin");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginscreen(),
                              ),
                            );
                          },

                          child: Text("Yes"),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),

                          child: Text("No"),
                        ),
                      ],
                    );
                  },
                );
              },

              child: Icon(Icons.logout),
            ),
          ],
        ),
        body: note.notedata.isEmpty
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("Empty Notes")),
              ],
            )
            : ListView.builder(
                itemCount: note.notedata.length,
                itemBuilder: (context, index) {
                  return List_item(
                    title: note.notedata[index]["title"],
                    text: note.notedata[index]["text"],
                  );
                },
              ),
      ),
    );
  }
}

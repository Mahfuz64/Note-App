import 'package:flutter/material.dart';
import 'package:mynote/database/Notesdata.dart';
import 'package:mynote/screen/LoginScreen.dart';
import 'package:mynote/screen/Viewnote.dart';
import 'package:mynote/screen/add.dart';
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
      if (info.notedata.isEmpty) {
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
        drawer: Drawer(
          child: Column(children: [DrawerHeader(child: Text("Hello"))]),
        ),
        floatingActionButton: FloatingActionButton(
          hoverColor: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addnote()),
            ).then((v){setState(() {
              
            });});
          },
          child: Icon(Icons.add),
        ),
        body: info.notedata.isEmpty
            ? Column(children: [Center(child: Text("Empty Notes"))])
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
                      itemCount: info.notedata.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewnote(index: index,))).then((value){setState(() {
                                
                              });});
                            },
                            child: ListTile(
                              title: Text(
                                info.notedata[index]["title"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                info.notedata[index]["text"],
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
                                        content: Text("Are Your sure to delete?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              info.trash.add({
                                                "title":
                                                    "${info.notedata[index]["title"]}",
                                                "text":
                                                    "${info.notedata[index]["text"]}",
                                              });
                            
                                              setState(() {
                                                info.notedata.removeAt(index);
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

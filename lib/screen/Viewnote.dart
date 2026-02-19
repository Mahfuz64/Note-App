import 'package:flutter/material.dart';
import 'package:mynote/database/Notesdata.dart';
import 'package:mynote/screen/edit.dart';


class Viewnote extends StatefulWidget {
  const Viewnote({super.key, required this.index});
  final int index;

  @override
  State<Viewnote> createState() => _ViewnoteState();
}

class _ViewnoteState extends State<Viewnote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB2BEB5),
      appBar: AppBar(
        centerTitle: true,
        title: Text("View Note"),
        
          
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Edit",

        onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Edit(index:widget.index,))).then((v){
              setState(() {
                
              });
            });

          },
          child: Icon(Icons.edit),
      ),
          
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 14),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "${info.notedata[widget.index]["title"]}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,fontFamily: "Times New Roman"),
              ),
            ),

            Text("${info.notedata[widget.index]["text"]}", style: TextStyle(fontSize: 18,)),
          ],
        ),
      ),
    );
  }
}

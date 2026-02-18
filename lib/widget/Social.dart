import 'package:flutter/material.dart';

class social extends StatelessWidget {
  const social({
    super.key, required this.imageaddress,
  });
  final String imageaddress;

  @override
  Widget build(BuildContext context) {
    return Card(
    
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50)
          ),
          child: Image.network("$imageaddress",fit: BoxFit.contain,),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
 
 String? texto;
 double size;
 Color? color;
 EdgeInsetsGeometry padding;

 TextWidget({required this.texto,required this.size, required this.color,required this.padding});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding,
      child: Text(
        this.texto!,
        
        style: TextStyle(color: this.color, fontSize: this.size, fontWeight: FontWeight.w700,decoration: this.size==14?TextDecoration.underline:null),  
      ),
    );
   
  }
}
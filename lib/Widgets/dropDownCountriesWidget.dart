

import 'package:flutter/material.dart';
import 'package:screen_signup/Widgets/textWidget.dart';

class DropDownWidget extends StatefulWidget {
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  static const opciones = [
    'assets/colombia.jpg',
    'assets/argentina.jpg',
    'assets/peru.png',
    
  ];

  final List<DropdownMenuItem<String>> dropDownMenuItems = opciones
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Container(
              padding: EdgeInsets.only(top:5,bottom:5),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10)
              ),
              child: CircleAvatar(radius: 20,backgroundImage: AssetImage(value))))).toList();
          

  String rutaId =  'assets/colombia.jpg';
  
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom:5),
          child: TextWidget(texto: ' Prefijo', size: 15, padding: EdgeInsets.zero, color: Colors.grey[600]),
        ),
        Container(
          height: size.height * 0.067,
          width: size.width * 0.25,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             border: Border.all(color: Colors.blue, width: 1.3),
           ),
          child: DropdownButton(
                  iconSize: 35,
                  icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.blue,), 
                  value: rutaId,
                  underline: Container(),
                   onChanged: (String? value){
                     print(value);
                     setState(() {
                       rutaId = value!;
                     });
                   },
                  items: this.dropDownMenuItems,
          ),
        ),
      ],
    );
  }
}




import 'package:flutter/material.dart';
import 'package:screen_signup/Widgets/textWidget.dart';

class DropDownIdTypes extends StatefulWidget {
  @override
  _DropDownIdTypesState createState() => _DropDownIdTypesState();
}

class _DropDownIdTypesState extends State<DropDownIdTypes> {
  static const opciones = [
    'Cédula de ciudadanía',
    'Documento 2',
    'Documento 3',
    
  ];

  final List<DropdownMenuItem<String>> dropDownMenuItems = opciones
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left:9 ),
              height: 47,
              width: 285,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextWidget(texto: value, size: 15, padding: EdgeInsets.zero, color: Colors.blue)
              ))).toList();
          

  String rutaId =  'Cédula de ciudadanía';
  
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(texto: 'Tipo de documento', size: 15, padding: EdgeInsets.zero, color: Colors.grey[600]),
          SizedBox(height: 5),
          Container(
            height: size.height * 0.066,
            width: size.width * 0.85,
             decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
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
      ),
    );
  }
}


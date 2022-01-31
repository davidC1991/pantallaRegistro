

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screen_signup/Provider/statesFormSignUp_Provider.dart';
import 'package:screen_signup/Widgets/textWidget.dart';

class CheckBox extends StatelessWidget {
  final String? text;
  final bool? state;

  CheckBox({this.text, this.state});
  @override
  Widget build(BuildContext context) {
    final StateTextForm stateTextForm = Provider.of<StateTextForm>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: 335,
      height: 40,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              stateTextForm.setDataCheckBox(this.text!, !stateTextForm.getDataCheckBox[this.text]!);
              stateTextForm.setDataValidationStream(this.text!, stateTextForm.getDataCheckBox[this.text]!);
            },
            child: Container(
              height: size.height * 0.03,
              width: size.width * 0.06,
              decoration: BoxDecoration(
                color: stateTextForm.getDataCheckBox[this.text]!?Colors.blue[50]:Colors.grey,
                borderRadius: BorderRadius.circular(7)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextWidget(texto: this.text!, size: 14, padding: EdgeInsets.zero, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

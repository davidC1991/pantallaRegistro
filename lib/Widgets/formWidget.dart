import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screen_signup/Provider/statesFormSignUp_Provider.dart';

class FormStateSignUp extends StatelessWidget {

  final GlobalKey<FormFieldState> formFieldKey = GlobalKey();
  final String labelText;
  final Icon?  icon;
  final EdgeInsetsGeometry padding;
  final String wichFieldIs;
  final double width;
  final double height;
  final bool isNum;
  String firstValue = '';
  FormStateSignUp({required this.isNum,required this.labelText, this.icon, required this.wichFieldIs, required this.padding, required this.width, required this.height});

  
 
  @override
  Widget build(BuildContext context) {
   final StateTextForm stateTextForm = Provider.of<StateTextForm>(context);
   return Container(
      alignment: Alignment.center,
      width: this.width,
      height: this.height,
      padding: this.padding,
      child: TextFormField(
        style: TextStyle(color: stateTextForm.isTouched[this.wichFieldIs]!?Colors.grey:Colors.blue, fontSize: 15, fontWeight: FontWeight.w700),
        key: formFieldKey,  
        keyboardType: this.isNum?TextInputType.number:TextInputType.text,
        textCapitalization: TextCapitalization.words,
        onTap: (){
          print('tocado');
          //stateTextForm.setTouch = true;
          stateTextForm.setTouchedMap(this.wichFieldIs, false);
        },
          
        onChanged: (value){
          print('value: $value');
            stateTextForm.saveFormValues(this.wichFieldIs,value);
          if (value ==''){
              print('esta vacio el value');
              stateTextForm.setTouchedMap(this.wichFieldIs, true);
            
              formFieldKey.currentState!.setValue(null);
            FocusScope.of(context).unfocus();
            
          }else if(formFieldKey.currentState!.isValid){
            
            stateTextForm.setDataValidationStream(this.wichFieldIs,true);
            
            
          }else if(!formFieldKey.currentState!.isValid){
              stateTextForm.setDataValidationStream(this.wichFieldIs,false);
              stateTextForm.setTouchedMap(this.wichFieldIs, false);
            
            }
          
        },
        validator: ( value ){
            // errorMessage = formFieldKey.currentState!.errorText??'nullo';
            // print(errorMessage);
          if ( value == null ) return 'Este campo es requerido';
          return value.length < 6 ? ' Minimo 6 caracteres' : null;
        },
        //focusNode: FocusNode(skipTraversal: true,descendantsAreFocusable : true),
        autovalidateMode:  AutovalidateMode.onUserInteraction,
        
        decoration: InputDecoration(
          
            fillColor: Colors.grey[350],
            filled:  stateTextForm.isTouched[this.wichFieldIs]!&&stateTextForm.getformValues[this.wichFieldIs]==''?true
                    :!stateTextForm.isTouched[this.wichFieldIs]!&&stateTextForm.getformValues[this.wichFieldIs]==''?true 
            :false,
                      
            labelStyle: TextStyle(color:Colors.grey[600], fontSize: 15, fontWeight: FontWeight.w700),
            contentPadding: EdgeInsets.fromLTRB(10.0, 17.0, 10.0, 17.0),
            labelText: this.labelText ,
            prefixIcon:   this.wichFieldIs=='mail'?Icon(Icons.mail_outline, color: stateTextForm.getformValues[this.wichFieldIs]! ==''?Colors.grey:Colors.blue,)
                        : this.wichFieldIs=='name'?Icon(Icons.account_circle_outlined, color: stateTextForm.getformValues[this.wichFieldIs]! ==''?Colors.grey:Colors.blue,)
                        : this.wichFieldIs=='surname'?Icon(Icons.account_circle_outlined, color: stateTextForm.getformValues[this.wichFieldIs]! ==''?Colors.grey:Colors.blue)
                        : this.wichFieldIs=='phone'?Icon(Icons.phone_outlined, color: stateTextForm.getformValues[this.wichFieldIs]! ==''?Colors.grey:Colors.blue) 
                        : null,
            //this.icon == null?null:this.icon,
            suffixIcon: stateTextForm.isAllDataValidated[this.wichFieldIs]!?Icon(Icons.check_circle_rounded,color: Colors.blue,):null,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5)
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.red, width: 1.5)
            ),
            enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: !stateTextForm.isTouched[this.wichFieldIs]!&&stateTextForm.getformValues[this.wichFieldIs]!!=''?Colors.blue:Colors.grey, width: 1.5)
            ),
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.blue, width: 1.5)
            ),
        )
        ),
      );
  }
}
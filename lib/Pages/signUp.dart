import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screen_signup/Provider/statesFormSignUp_Provider.dart';
import 'package:screen_signup/Widgets/checkBox.dart';
import 'package:screen_signup/Widgets/dropDownCountriesWidget.dart';
import 'package:screen_signup/Widgets/dropDownIdTypesWidget.dart';
import 'package:screen_signup/Widgets/formWidget.dart';
import 'package:screen_signup/Widgets/textWidget.dart';



class SignUpPage extends StatelessWidget {
  final double width  = 335;
  final double height = 70;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black,),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: TextWidget(texto: 'Completa tu registro', size: 20, padding: EdgeInsets.zero, color: Colors.black),),
      body:Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             FormStateSignUp(isNum: false, labelText: 'Correo electrónico', icon:Icon(Icons.mail_outline, color: Colors.blue,), wichFieldIs: 'mail',   padding:EdgeInsets.zero, width: width, height: height, ),
             FormStateSignUp(isNum: false, labelText: 'Nombre',             icon:Icon(Icons.account_circle_outlined),           wichFieldIs: 'name',   padding:EdgeInsets.zero, width: width, height: height,),
             FormStateSignUp(isNum: false, labelText: 'Apellido',           icon:Icon(Icons.account_circle_outlined),           wichFieldIs: 'surname',padding:EdgeInsets.zero, width: width, height: height,),
             SizedBox(height: 7,),
             infoPhoneWidget(),
             DropDownIdTypes(),
             FormStateSignUp(isNum: true, labelText: 'Número de documento', icon:null,wichFieldIs: 'id',padding:EdgeInsets.zero,width: width,height: height,),
             SizedBox(height: 35,),
             referenceCodeWidget(),
             FormStateSignUp(isNum: false, labelText: 'Ingresa código(no obligatorio)', icon:null,wichFieldIs: 'code',padding:EdgeInsets.zero,width: width,height: height,),
             SizedBox(height: 50,),
             CheckBox(text: 'Acepto los Términos y condiciones'),
             CheckBox(text: 'Acepto los Aviso de privacidad'),
             CheckBox(text: 'Acepto el manual de tratamiento de datos'),
             singInButtonMail(context),
            ],
          ),
        ),
      ),
    );
  }

  Container referenceCodeWidget() {
    return Container(
      width: this.width,
      child: Row(
        children: [
          Icon(Icons.circle, size: 40, color: Colors.blue),
          SizedBox(width: 7,),
          TextWidget(texto: '¿Fuiste referido?', size: 15, padding: EdgeInsets.zero, color: Colors.blue)
        ],
      ),
    );
  }

  Container infoPhoneWidget() {
    return Container(
      width: this.width,
      height: this.height+20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropDownWidget(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(texto: ' Numero de Télefono', size: 15, padding: EdgeInsets.zero, color: Colors.grey[600]),
                Container(
                  height: this.height-4,
                  padding: EdgeInsets.only(left: 5),
                  child: FormStateSignUp(isNum: true, labelText: '', icon:Icon(Icons.phone_outlined),wichFieldIs: 'phone',padding:EdgeInsets.zero,width: width,height: height )),
              ],
            ),
          )],
          ),
    );
  }
        
      

  Widget singInButtonMail(BuildContext context){
   final StateTextForm stateTextForm = Provider.of<StateTextForm>(context, listen: false);
   return StreamBuilder(
     stream: stateTextForm.dataValidated.stream,
     builder: (BuildContext context, AsyncSnapshot snapshot) {
      final data = snapshot.data??{'':false};
      data['code'] = true;
      return Padding(
        padding: const EdgeInsets.only(top:30,bottom: 30),
        child: TextButton(
          onPressed: (){},
          child: Container(
            alignment: Alignment.center,
            width: this.width,
            height: this.height -10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: data.containsValue(false)?Colors.grey:Colors.blue,
            ),
            child: TextWidget(texto: 'Continuar', size: 20, padding: EdgeInsets.zero, color: Colors.white54)
          )
        ),
      ); 
     },
   );  
  }
}
   
     



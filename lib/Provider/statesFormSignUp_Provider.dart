import 'dart:async';

import 'package:flutter/foundation.dart';
class StateTextForm extends ChangeNotifier{


Map<String,bool> _isTouchedMap       = {'name':true, 'mail':true, 'surname':true, 'phone':true,  'id':true,  'code':true};
Map<String,bool> _isAllDataValidated = {'name':false,'mail':false,'surname':false,'phone':false, 'id':false, 'code':false,'Acepto los Términos y condiciones':false,'Acepto los Aviso de privacidad':false,'Acepto el manual de tratamiento de datos':false};
Map<String,String> _formValues       = {'name':'',   'mail':'',   'surname':'',   'phone':'',    'id':'',    'code':'',};
Map<String,bool> _isDataCheckBox     = {'Acepto los Términos y condiciones':false,'Acepto los Aviso de privacidad':false,'Acepto el manual de tratamiento de datos':false};
StreamController<Map<String,bool>>  _dataValidated = StreamController<Map<String,bool>>();


//----------GETTERS--AND---SETTERS--AND---FUNCTIONS---------------------------------
Map<String,bool> get isTouched => this._isTouchedMap;

void setTouchedMap( String fieldName, bool valor){
   this._isTouchedMap[fieldName]=valor;
   notifyListeners();
 }

//-----------------------------------------------------
StreamController<Map<String,bool>> get dataValidated => this._dataValidated;

Map<String,bool> get isAllDataValidated => this._isAllDataValidated;

void closeStream(){
   this._dataValidated.close();
}

void setDataValidationStream(String fieldName, bool valor){
  this._isAllDataValidated[fieldName]=valor;
  this._dataValidated.sink.add(this._isAllDataValidated);
}

//-----------------------------------------------------
Map<String,String> get getformValues => this._formValues;

void saveFormValues( String fieldName, String valor){
    this._formValues[fieldName]=valor;
   notifyListeners();
 }

//-----------------------------------------------------

Map<String,bool> get getDataCheckBox => this._isDataCheckBox;

void setDataCheckBox( String fieldName, bool valor){
   this._isDataCheckBox[fieldName]=valor;
   notifyListeners();
 }
//-----------------------------------------------------

}
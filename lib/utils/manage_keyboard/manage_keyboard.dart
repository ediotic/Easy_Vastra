import 'package:flutter/material.dart';

class ManageKeyboard {
   static void hideKeyboad(BuildContext context){
     FocusScopeNode currentFocus = FocusScope.of(context);

     if(!currentFocus.hasPrimaryFocus){
       currentFocus.unfocus();
     }
   }
}
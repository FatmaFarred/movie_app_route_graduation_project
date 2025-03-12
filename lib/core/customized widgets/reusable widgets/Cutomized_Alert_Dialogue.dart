import 'package:flutter/material.dart';

class Customizied_Alert_Dialogue{

  static void showLoading ({
   required BuildContext context,
    Color backgroundColor= Colors.white,
    required String message,
  }){
  showDialog(context: context, builder: (context){
    return AlertDialog(backgroundColor:backgroundColor ,
    content: Row(children: [
      CircularProgressIndicator(),
      Text(message),

    ],),
    );

  });
  }

  static void hideLoading ({ required BuildContext context}){
  Navigator.of(context).pop();
  }

  static void showMessage ({required BuildContext context ,
    Color backgroundColor= Colors.white,
   required String message,
    String title="",
    Function? positiveActionButton,
    Function? NigativeActionButton,
    String ? positiveActionButtonName,
    String ? NigativeActionButtonName,

  }){
    List<Widget>actionList=[];
      if (positiveActionButtonName!=null){
       actionList.add(TextButton(onPressed:() {
         positiveActionButton!();
       }, child: Text(positiveActionButtonName)));
      }
    if (NigativeActionButtonName!=null){
      actionList.add(TextButton(onPressed:() {
        positiveActionButton!();
      }, child: Text(NigativeActionButtonName)));
    }


    showDialog(barrierDismissible:false , /// tapping on the barrier will dismiss the dialog
        context: context, builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        content: Text(message),
        title: Text(title),
        actions: actionList,

      );

    });



}



}
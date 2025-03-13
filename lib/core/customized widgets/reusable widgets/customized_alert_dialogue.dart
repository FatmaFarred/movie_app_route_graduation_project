import 'package:flutter/material.dart';

class CustomizedAlertDialogue{

  static void showLoading ({
   required BuildContext context,
    Color backgroundColor= Colors.white,
    required String message,
  }){
  showDialog(context: context, builder: (context){
    return AlertDialog(backgroundColor:backgroundColor ,
    content: Row(children: [
      const CircularProgressIndicator(),
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
    Function? negativeActionButton,
    String ? positiveActionButtonName,
    String ? negativeActionButtonName,

  }){
    List<Widget>actionList=[];
      if (positiveActionButtonName!=null){
       actionList.add(TextButton(onPressed:() {
         positiveActionButton?.call();
       }, child: Text(positiveActionButtonName)));
      }
    if (negativeActionButtonName!=null){
      actionList.add(TextButton(onPressed:negativeActionButton?.call() , child: Text(negativeActionButtonName)));
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
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message){
  Fluttertoast.showToast(
    msg:message,
    backgroundColor: Colors.red,
    textColor:Colors.white,
    fontSize:16.0,
  );
}

showLoaderDialog(BuildContext context)
{
  AlertDialog alert =AlertDialog(
    content: Builder(builder: (context){
      return SizedBox(
        width:100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: Color(0xffe16555),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Container(
              margin: const EdgeInsets.only(left:7),
              child: const Text("Loading..."),
            ),
          ],
        ),
      );
    }),
  );
}
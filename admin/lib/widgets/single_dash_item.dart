// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleDashItem extends StatelessWidget {
    final String title, subtitle;
    final  void Function()? onPressed;
    const SingleDashItem(
      {super.key, 
      required this.subtitle,
       required this.title,
       required this.onPressed
       });
  @override
  Widget build(BuildContext context) {
    return  CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Card(
            child: Container(
              width: double.infinity ,
              // colors of dashboard 
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    title,
                  style:TextStyle(
                    fontSize: 35.0,
                  )),
                      Text(
                        subtitle, 
                      style:TextStyle(
                    fontSize: 28.0,
                  )),
                ],
              ),
            ),
          ),
    );
  }
}
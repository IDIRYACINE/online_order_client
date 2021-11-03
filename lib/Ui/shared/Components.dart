import 'dart:ffi';

import 'package:flutter/material.dart';
Widget defaultbutton ({
   Color? color=Colors.red,
   double? width=double.infinity,
   double? hight=70,
   double? raduis=0,
  required String? CategorieName, 
  required Function? function}){
    return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(raduis!),
              color: color,
            ),
            width: width,
            height:hight,
            child: MaterialButton(
              onPressed:(){ function; },
              child: Text('$CategorieName',
              style: const TextStyle(
                fontSize: 40,
                fontFamily: 'Dancing',
                fontWeight: FontWeight.bold
              ),
              ),
              ),
          );
  }

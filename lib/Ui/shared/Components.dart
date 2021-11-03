import 'package:flutter/material.dart';
import 'package:online_order_client/Models/catalogue_model.dart';
Widget defaultbutton ({
   Color? color=Colors.red,
   double? width=double.infinity,
   double? hight=70,
   double? raduis=0,
  required double? CategorieID, 
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
              child: Text('${getCategoryName(CategorieID)}',
              style: const TextStyle(
                fontSize: 40,
                fontFamily: 'Dancing',
                fontWeight: FontWeight.bold
              ),
              ),
              ),
          );
  }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget
{
  String hint;
  bool isObscure;
  TextEditingController controller;
  TextInputType textInputType;

  CustomTextField({required this.hint,required this.controller, required this.textInputType,this.isObscure=false});

  @override
  Widget build(BuildContext context) {
   return TextField(
     controller: controller,
     cursorColor: Colors.white,
     obscureText: isObscure,
     keyboardType: textInputType,
     style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white,fontSize: 17)),
     decoration: InputDecoration(
         contentPadding: const EdgeInsets.all(15),
         enabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15.0),
             borderSide: const BorderSide(color: Colors.white,width: 1)
         ),
         focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15.0),
             borderSide: const BorderSide(color: Colors.white,width: 1)
         ),
         filled: true,
         hintStyle: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey[400],fontSize: 17)),
         hintText: hint,
         fillColor: Colors.black87),
   );
  }

}
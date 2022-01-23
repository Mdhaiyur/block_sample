import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget
{
  Color backgroundColor;
  String title;
  Function() onPress;

  CustomButton({required this.backgroundColor, required this.title,required this.onPress});

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
       onPressed: onPress,
       style: ElevatedButton.styleFrom(
         primary: backgroundColor,
         minimumSize: const Size.fromHeight(50),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(15.0),
         ),
       ),
       child: Text(title,
           style: GoogleFonts.poppins(
               fontSize: 17, color: Colors.black)));
  }


}
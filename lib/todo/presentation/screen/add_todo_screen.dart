import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Add Todo',
          style: GoogleFonts.poppins(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Save',
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.w300,
          letterSpacing: 4,
        ),
      ),
    );
  }
}

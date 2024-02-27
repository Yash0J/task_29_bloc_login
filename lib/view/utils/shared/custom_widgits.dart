import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom {
  static Text text({
    String? text,
    TextAlign? textAlign,
    double? fontSize = 14,
    FontWeight? fontWeight,
    Color? colors = const Color(0xffe6e1e4),
  }) {
    return Text(
      text!,
      textAlign: textAlign,
      style: GoogleFonts.openSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: colors,
      ),
    );
  }

  static TextStyle style({
    TextAlign? textAlign,
    double? fontSize = 14,
    FontWeight? fontWeight,
    Color? colors = const Color(0xffe6e1e4),
  }) {
    return GoogleFonts.openSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: colors,
    );
  }

  static TextFormField textField({
    Widget? label,
    FloatingLabelBehavior? floatingLabelBehavior,
    String? hintText,
    TextStyle? hintStyle,
    bool? filled = true,
    Color? fillColor = const Color(0xFF5A5083),
    Color? cursorColor = const Color(0xffe6e1e4),
    Widget? prefix,
    Icon? prefixIcon,
    Widget? suffix,
    Icon? suffixIcon,
    FloatingLabelAlignment? floatingLabelAlignment =
        FloatingLabelAlignment.start,
    bool? alignLabelWithHint = true,
    bool obscureText = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      obscureText: obscureText,
      cursorColor: cursorColor,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefix: prefix,
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintStyle: hintStyle,
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.never,
        label: label,
        floatingLabelAlignment: floatingLabelAlignment,
        alignLabelWithHint: alignLabelWithHint,
      ),
    );
  }
}

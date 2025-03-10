import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/app_widget/custom_textstyle.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool showBorder;
  final bool readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color borderColor;
  final Color? hintStyleColor;
  final double borderRadius;
  final VoidCallback? visibility;
  final Function(String)? onChanged;


  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.visibility,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.borderColor= Colors.grey,
    this.borderRadius = 0.0,
    this.showBorder = true,
    this.readOnly = false,
    this.hintStyleColor,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
      readOnly: readOnly ,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyle12(context, color: hintStyleColor??  Colors.black),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon,color: Colors.grey,) : null,
        suffixIcon: suffixIcon != null ? InkWell(
            onTap: visibility,
            child: Icon(suffixIcon, color: Colors.grey,)) : null,
         border:showBorder ? UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)):InputBorder.none,
        enabledBorder:showBorder ? UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)):InputBorder.none,
        focusedBorder:showBorder ? UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)):InputBorder.none,
         // focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor, width: 1),
        ),
    );
  }
}
import 'package:ecommerce/utils/AppColors.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatefulWidget {
   AppTextfield({
    super.key,
    required this.hintText,
    this.trailingIcon,
    this.leadingIcon,
    required this.controller
  });
  String hintText;
  IconData? trailingIcon;
  IconData? leadingIcon;
  TextEditingController controller;

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.white,
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.grey, width: 2.0),
                borderRadius:
                    BorderRadius.all(Radius.circular(5.0))),
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                    color: Colors.grey, width: 1.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                    color: Appcolors.PrimaryColor, width: 1.0)),
            hintText: widget.hintText,
            prefixIcon: Icon(widget.leadingIcon, color: Colors.black54,),
            suffixIcon: Icon(widget.trailingIcon, color: Colors.black54)));
  }
}

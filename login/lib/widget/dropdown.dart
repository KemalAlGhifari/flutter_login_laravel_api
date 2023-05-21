import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Select"),value: ""),
    DropdownMenuItem(child: Text("Novel"),value: "Novel"),
    DropdownMenuItem(child: Text("Majalah"),value: "Majalah"),
    DropdownMenuItem(child: Text("Biografi"),value: "Biografi"),
  ];
  return menuItems;
}
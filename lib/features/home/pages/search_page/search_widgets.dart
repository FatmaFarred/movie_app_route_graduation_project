import 'package:flutter/material.dart';


Widget searchTextField(BuildContext context){
  return TextFormField(
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(Icons.search_rounded),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
      ));
}
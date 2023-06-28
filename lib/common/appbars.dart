import 'package:flutter/material.dart';

class GeneralAppBar {
  AppBar generalAppBar(String title) {
    return AppBar(
      leading: const Icon(Icons.currency_exchange_rounded, size: 30,),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.green.shade700,
      elevation: 25,
    );
  }
}

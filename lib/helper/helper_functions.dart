import 'package:flutter/material.dart';

// display error message to user
void displayErrorMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(),
  );
}

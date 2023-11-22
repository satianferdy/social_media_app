import 'package:flutter/material.dart';

// display error message to user
void displayErrorMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("an error occured"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "OK",
            style: TextStyle(color: Colors.grey[800]),
          ),
        ),
      ],
    ),
  );
}

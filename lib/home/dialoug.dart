import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox({super.key});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  final TextEditingController _idController = TextEditingController();

  void _showIDDialog(String enteredID) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ID Information'),
          content: Text('Entered ID: $enteredID'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Search Dialog Box'),
      content: Column(
        children: [
          const Text('Enter ID:'),
          TextField(
            controller: _idController,
            decoration: const InputDecoration(
              hintText: 'Enter ID',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog box
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            String enteredID = _idController.text;
            if (enteredID == '123456') {
              // If the entered ID is '123456', show another dialog with the ID
              _showIDDialog(enteredID);
            }
            // You can add more conditions or logic as needed
            Navigator.of(context).pop();
          },
          child: const Text('Search'),
        ),
      ],
    );
  }
}
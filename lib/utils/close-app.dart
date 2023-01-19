import 'package:flutter/material.dart';

Future<bool> onpressKit(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            content: const Text('Do your want to close this app'),
            title: const Text('Deally'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('No')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Yes')),
            ],
          ));

  return exitApp;
}

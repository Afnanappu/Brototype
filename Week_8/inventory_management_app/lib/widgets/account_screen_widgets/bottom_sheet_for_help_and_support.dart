import 'package:flutter/material.dart';
import 'package:inventory_management_app/functions/help_and_support.dart';

class CustomHelpBottomSheet {
  CustomHelpBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 30),
            title: const Text('Call Us'),
            leading: const Icon(Icons.call_outlined),
            onTap: () => makeHelpAndSupport(path: '+919947907250'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 30),
            title: const Text('Mail Us'),
            leading: const Icon(Icons.mail_outline_outlined),
            onTap: () => makeHelpAndSupport(
              path: 'afnanp860@gmail.com',
              isTel: false,
            ),
          ),
        ],
      ),
    );
  }
}

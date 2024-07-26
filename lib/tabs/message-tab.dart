import 'package:collegehub/message-items.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessagTeab extends StatelessWidget {
  const MessagTeab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('messagebutton'.tr()),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return MessageItems();
              },
            ),
          ),
        ],
      ),
    );
  }
}

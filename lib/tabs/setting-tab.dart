import 'package:collegehub/tabs/language_bottomsheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "language".tr(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: true,
                backgroundColor: Colors.white,
                builder: (context) {
                  return LanguageBottomSheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.red),
              ),
              child: context.locale == Locale("ar")
                  ? Text(
                      "arabic".tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  : Text(
                      "english".tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

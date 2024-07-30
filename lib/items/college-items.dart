// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:collegehub/screens/college-screen.dart';
import 'package:flutter/material.dart';

class CollegeItems extends StatelessWidget {
  const CollegeItems({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CollegeScreen.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff495057),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'College Name',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.start,
                'Location: City, State',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Course: Computer Science',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Contact Information: Phone Number, Email',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

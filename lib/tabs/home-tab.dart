// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/university.png",
              height: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 10,
                shadowColor: Color(0xff780000),
                color: Color(0xff669bbc),
                child: Container(
                  child: Column(
                    children: [
                      Divider(
                        color: Color(0xff003049),
                        thickness: 3,
                      ),
                      Text(
                        "My colleges",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        color: Color(0xff003049),
                        thickness: 3,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(Icons.school),
                              title: Text("College ${index + 1}"),
                              onTap: () {},
                            );
                          },
                          itemCount: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:connections/Views/DateListView.dart';
import 'package:connections/controllers/DateController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const DatingApp());
}

class DatingApp extends StatelessWidget {
  const DatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dating App',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(160.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0), // Rounded corners for the blue box
                child: Container(
                  color: Colors.blue, // Blue background
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                          child: Text(
                            'Connection App',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // White background for search bar
                            borderRadius: BorderRadius.circular(30.0), // Rounded corners
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 14.0),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey, // Grey icon color
                              ),
                              hintText: 'Search connections...',
                              hintStyle: TextStyle(
                                color: Colors.grey, // Grey placeholder text color
                                fontSize: 16,
                              ),
                              border: InputBorder.none, // Remove underline border
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0), // Spacing below the search bar
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: GetBuilder<DateController>(
            init: DateController(),
            builder: (_) => const DateListView(),
          ),
        ),
      ),
    );
  }
}

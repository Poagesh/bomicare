import 'package:bomicare/Intros/introPageFive.dart';
import 'package:bomicare/Intros/introPageThree.dart';
import 'package:bomicare/pages/Home_page.dart';
import 'package:flutter/material.dart';

 // Ensure the correct path

class IntroPageFour extends StatelessWidget {
  const IntroPageFour({super.key});

  @override
  Widget build(BuildContext context) {
        final Map<String, String> addressDetails = {
      'address1': '2302 Mount Way',
      'address2': 'Montgomery',
      'address3': 'Alabama, 31712',
    };
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 0, 230),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // H1 tag
                  Center(
                    child: Text(
                      "Track the Moisture Levels!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 20,),

                  //H3 tag
                  Center(
                    child: Text(
                      "Keep in track about the Moisture levels, water levels and etc...."
,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green[900],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 100,),

                  // Next button
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IntroPageFive(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 255, 8),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Skip button at top right corner
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                   builder: (context) => HomePage(
                    addressDetails: addressDetails,
                    updateAddress: (newAddressDetails) {
                      // Placeholder for update logic (can be implemented elsewhere)
                    },
                  )// Make sure HomePage is properly defined
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 67, 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),

          // Previous button at bottom left corner
          Positioned(
            bottom: 40,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IntroPageThree(), // Make sure PreviousPage is properly defined
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 255, 8),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Previous',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

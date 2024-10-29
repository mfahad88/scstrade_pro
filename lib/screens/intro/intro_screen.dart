import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {

  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Seamless Trading Experience",
      bodyWidget: Column(
        children: [
          Text("Seamless Trading Experience", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {}, child: Text('Deposit')),
                    TextButton(onPressed: () {}, child: Text('Withdraw')),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Enter amount', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Deposit money"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: PageDecoration(
        bodyFlex: 2,
        imageFlex: 3,
        bodyAlignment: Alignment.center,
        imageAlignment: Alignment.bottomCenter,
      ),
    ),
    PageViewModel(
      title: "Real-Time Market Insights",
      bodyWidget: Column(
        children: [
          Text("Real-Time Market Insights", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {}, child: Text('Deposit')),
                    TextButton(onPressed: () {}, child: Text('Withdraw')),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Enter amount', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Deposit money"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: PageDecoration(
        bodyFlex: 2,
        imageFlex: 3,
        bodyAlignment: Alignment.center,
        imageAlignment: Alignment.bottomCenter,
      ),
    ),
    PageViewModel(
      title: "Manage Your Portfolio with Ease",
      bodyWidget: Column(
        children: [
          Text("Manage Your Portfolio with Ease", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("Infisys"),
                  Text("\$2,210.02", style: TextStyle(color: Colors.green)),
                ]),
                // Add more rows to simulate portfolio data
              ],
            ),
          ),
        ],
      ),
      decoration: PageDecoration(
        bodyFlex: 2,
        imageFlex: 3,
        bodyAlignment: Alignment.center,
        imageAlignment: Alignment.bottomCenter,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      onDone: () {
        // Navigate to Home Screen or Login Screen
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Get Started", style: TextStyle(fontWeight: FontWeight.bold)),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.black26,
        activeSize: Size(10.0, 10.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
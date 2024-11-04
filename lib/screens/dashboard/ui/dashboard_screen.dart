import 'package:flutter/material.dart';
import 'package:scstrade_pro/screens/dashboard/ui/widgets/card_index.dart';
import 'package:scstrade_pro/screens/dashboard/ui/widgets/portfolio_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            PortfolioCard(),
            Container(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,

                itemBuilder: (context, index) {
                  return CardIndex();
                },),
            )
          ],
        ),
      ),
    );
  }
}

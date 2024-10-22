import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';

class SnapshotScreen extends StatelessWidget {
  final StockData stockData;
  const SnapshotScreen({super.key,required this.stockData});

  @override
  Widget build(BuildContext context) {
    StockProvider stockProvider=Provider.of(context,listen: false);
    stockProvider.fetchSnapshot(stockData.sym??"");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(stockData.nm??"No name found"),
        ),
        body: Consumer<StockProvider>(builder: (BuildContext context, StockProvider provider, Widget? child) {
          return provider.isLoading?const Center(child: CircularProgressIndicator(),):Column(
            children: [
              populateCard(
                  child: Column(
                    children: [
                      const Text('Stock Price & Performance',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      ),
                      Row(
                        children: [
                          const Text('Market Cap: '),
                          Text(provider.overview?.marketCap??"0")
                        ],
                      )
                    ],
                  )
              ),
              const SizedBox(height: 5.0,),
              populateCard(
                  child: const Column(
                    children: [
                      Text('Market Valuation',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 5.0,),
              populateCard(
                  child: const Column(
                    children: [
                      Text('Technical Indicators',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 5.0,),
              populateCard(
                  child: const Column(
                    children: [
                      Text('Financial Data',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 5.0,),
              populateCard(
                  child: const Column(
                    children: [
                      Text('Corporate Overview',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      )
                    ],
                  )
              ),
            ],
          );
        },

        ),
      ),
    );
  }

  Widget populateCard({Widget? child}){
    return Card.outlined(
      clipBehavior: Clip.none,
      color: Colors.grey.shade50,
      elevation: 5.0,
      child: child,
    );
  }
}

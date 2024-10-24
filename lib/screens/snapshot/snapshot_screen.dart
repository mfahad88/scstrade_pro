import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/helper/Utils.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(stockData.sym??"No name found"),
          backgroundColor: Colors.grey.shade200,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),
        ),
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(stockData.nm??"",
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Row(
                  children: [
                    Text('Rs. 171.25',
                      style: TextStyle(
                          fontSize:16,
                          fontWeight: FontWeight.w800,
                          color: Colors.blueGrey.shade500
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Text('2.11 (1.25%)',
                      style: TextStyle(
                          fontSize:16,
                          fontWeight: FontWeight.w800,
                          color: Colors.green.shade500
                      ),
                    ),
                  ],
                ),
                /*     Divider(
                  color: Colors.greenAccent.shade200,
                  thickness: 2,
                ),*/
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Market Stats',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                      Divider(
                        color: Colors.greenAccent.shade200,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildColumnKeyValue(key:'Volume', value: '3,354,110'),
                          buildColumnKeyValue(key:'Market Cap', value: '736.53 bn'),
                          buildColumnKeyValue(key:'Avg Volume (12M)', value: '9,366,486', width: MediaQuery.of(context).size.width *.3)
                         /* Expanded(
                            child: Column(
                              children: [
                                buildColumnKeyValue(key:'Volume', value: '3,354,110')
                                *//*Text('Volume',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('3,354,110 ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey.shade500
                                  ),
                                ),*//*
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('Market Cap',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('736.53 bn ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey.shade500
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('Avg Volume (12M)',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('9,366,486',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey.shade500
                                  ),
                                ),
                              ],
                            ),
                          ),*/
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Price Range',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                      Divider(
                        color: Colors.greenAccent.shade200,
                        thickness: 2,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('Day\'s Range',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_downward,color: Colors.red.shade400,size: 15,),
                                    Text('Rs. 169.20 ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueGrey.shade500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_upward,color: Colors.green.shade400,size: 15,),
                                    Text('Rs. 172.95 ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueGrey.shade500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('1 Month Range',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_downward,color: Colors.red.shade400,size: 15,),
                                    Text('Rs. 169.20 ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueGrey.shade500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_upward,color: Colors.green.shade400,size: 15,),
                                    Text('Rs. 172.95 ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueGrey.shade500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('6 Month Range',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_downward,color: Colors.red.shade400,size: 15,),
                                    Text('Rs. 169.20 ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueGrey.shade500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_upward,color: Colors.green.shade400,size: 15,),
                                    Text('Rs. 172.95 ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueGrey.shade500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('52 Week\'s Range ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_downward,color: Colors.red.shade400,size: 15,),
                                    Text('Rs. 169.20 ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueGrey.shade500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_upward,color: Colors.green.shade400,size: 15,),
                                    Text('Rs. 172.95 ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueGrey.shade500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Performance Stats',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                      Divider(
                        color: Colors.greenAccent.shade200,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(

                              children: [
                                Text('1 Month',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('22.03%',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green.shade500
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('3 Month',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('22.03%',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green.shade500
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('6 Month',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('22.03%',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green.shade500
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('1 Year',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('22.03%',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green.shade500
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Financial Stats',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                        Divider(
                          color: Colors.greenAccent.shade200,
                          thickness: 2,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 5.0,
                          spacing: 18.0,
                          children: [
                            buildColumnKeyValue(key: 'Paid Up Capital', value:'22.03%'),
                            buildColumnKeyValue(key: 'Authorized Capital', value:'22.03%' ,width: MediaQuery.of(context).size.width *.3),
                            buildColumnKeyValue(key: 'Total No. Shares', value:'22.03%',width: MediaQuery.of(context).size.width *.25),
                            buildColumnKeyValue(key: 'Free Float', value:'22.03%'),
                            buildColumnKeyValue(key: 'Beta', value:'22.03%'),
                            buildColumnKeyValue(key: 'Face Value', value:'22.03%'),
                            buildColumnKeyValue(key: 'Free Float %', value:'22.03%'),
                            buildColumnKeyValue(key: 'Year End', value:'22.03%'),
                            buildColumnKeyValue(key: 'Market Cap', value:'22.03%'),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildColumnKeyValue({String? key,String? value,double? width }) {
    return SizedBox(
      width: width??100,
      child: Column(
        children: [
          Container(
            color: Colors.red,
            child: Text(key??"",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(value??"",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey.shade500
            ),
          ),
        ],
      ),
    );
  }

  Widget populateCard({Widget? child}){
    return Card.outlined(
      clipBehavior: Clip.none,
      color: Colors.grey.shade50,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
        child: child,
      ),
    );
  }

  Widget keyText(String text){
    return Text(text,
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black45
      ),
    );
  }
}

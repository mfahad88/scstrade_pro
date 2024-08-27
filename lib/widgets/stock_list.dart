import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StockList extends StatelessWidget {
  const StockList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [

          Container(
            color: Colors.yellow,
            width: 70,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 200,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index==0?
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text("Company",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ): Text("data $index"),

                  ],
                );

              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index==0?
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text("Current Price",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ): Text("data $index"),

                          ],
                        );

                      },
                    ),
                  ),
                  Container(
                    width: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index==0?
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text("Volume",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ): Text("data $index"),

                          ],
                        );

                      },
                    ),
                  ),
                  Container(
                    width: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index==0?
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text("Change",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ): Text("data $index"),

                          ],
                        );

                      },
                    ),
                  ),
                  Container(
                    width: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index==0?
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text("High",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ): Text("data $index"),

                          ],
                        );

                      },
                    ),
                  ),
                  Container(
                    width: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index==0?
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text("Low",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ): Text("data $index"),

                          ],
                        );

                      },
                    ),
                  ),
                  Container(
                    width: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index==0?
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text("Buy Stock",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ): Text("data $index"),

                          ],
                        );

                      },
                    ),
                  ),

                  Container(
                    width: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index==0?
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text("Buy Price",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ): Text("data $index"),

                          ],
                        );

                      },
                    ),
                  ),
                  Container(
                    width: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index==0?
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text("Sell Stock",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ): Text("data $index"),

                          ],
                        );

                      },
                    ),
                  ),
                  Container(
                    width: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 200,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index==0?
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text("Sell Price",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ): Text("data $index"),

                          ],
                        );

                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


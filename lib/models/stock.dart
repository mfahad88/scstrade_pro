import 'package:scstrade_pro/data/dto/Stock_data.dart';

class Stock{
  StockData stockData;
  double opacityBp=0.0;
  double opacityBv=0.0;
  double opacityAp=0.0;
  double opacityAv=0.0;
  bool isWatchList=false;

  Stock(this.stockData, this.opacityBp, this.opacityBv, this.opacityAp,
      this.opacityAv, this.isWatchList);
}
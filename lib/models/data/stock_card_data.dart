import 'package:fl_chart/fl_chart.dart';

class StockCardData{
  String? image;
  String? index;
  String? symbol;
  String? name;
  String? volume;
  String? closingPrice;
  String? changeValue;
  String? changePercent;
  String? high;
  String? low;
  String? askPrice;
  String? askVolume;
  String? bidPrice;
  String? bidVolume;
  List<FlSpot>? spots;

  StockCardData(
      this.image,
      this.index,
      this.symbol,
      this.name,
      this.volume,
      this.closingPrice,
      this.changeValue,
      this.changePercent,
      this.high,
      this.low,
      this.askPrice,
      this.askVolume,
      this.bidPrice,
      this.bidVolume,
      this.spots);

  StockCardData.empty();

  @override
  String toString() {
    return 'StockCardData{image: $image, index: $index, symbol: $symbol, name: $name, volume: $volume, closingPrice: $closingPrice, changeValue: $changeValue, changePercent: $changePercent, high: $high, low: $low, askPrice: $askPrice, askVolume: $askVolume, bidPrice: $bidPrice, bidVolume: $bidVolume, spots: $spots}';
  }
}
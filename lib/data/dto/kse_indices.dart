class KseIndices {
  KseIndices({
    required this.indexCode,
    required this.currentIndex,
    required this.volumeTraded,
    required this.valueTraded,
    required this.highIndex,
    required this.lowIndex,
    required this.netChange,
    required this.preClose,
    required this.marketStatus,
  });

  final String? indexCode;
  static const String indexCodeKey = "INDEX_CODE";

  final String? currentIndex;
  static const String currentIndexKey = "CURRENT_INDEX";

  final String? volumeTraded;
  static const String volumeTradedKey = "VOLUME_TRADED";

  final String? valueTraded;
  static const String valueTradedKey = "VALUE_TRADED";

  final String? highIndex;
  static const String highIndexKey = "HIGH_INDEX";

  final String? lowIndex;
  static const String lowIndexKey = "LOW_INDEX";

  final String? netChange;
  static const String netChangeKey = "NET_CHANGE";

  final double? preClose;
  static const String preCloseKey = "PreClose";

  final String? marketStatus;
  static const String marketStatusKey = "MarketStatus";


  factory KseIndices.fromJson(Map<String, dynamic> json){
    return KseIndices(
      indexCode: json["INDEX_CODE"],
      currentIndex: json["CURRENT_INDEX"],
      volumeTraded: json["VOLUME_TRADED"],
      valueTraded: json["VALUE_TRADED"],
      highIndex: json["HIGH_INDEX"],
      lowIndex: json["LOW_INDEX"],
      netChange: json["NET_CHANGE"],
      preClose: json["PreClose"],
      marketStatus: json["MarketStatus"],
    );
  }

  Map<String, dynamic> toJson() => {
    "INDEX_CODE": indexCode,
    "CURRENT_INDEX": currentIndex,
    "VOLUME_TRADED": volumeTraded,
    "VALUE_TRADED": valueTraded,
    "HIGH_INDEX": highIndex,
    "LOW_INDEX": lowIndex,
    "NET_CHANGE": netChange,
    "PreClose": preClose,
    "MarketStatus": marketStatus,
  };

}

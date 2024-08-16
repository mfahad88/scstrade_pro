class KseIndex {
  final String indexCode;
  final String currentIndex;
  final String volumeTraded;
  final String valueTraded;
  final String highIndex;
  final String lowIndex;
  final String netChange;
  final double preClose;
  final String marketStatus;

  KseIndex({
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

  // Factory method to create a KseIndex object from a JSON map
  factory KseIndex.fromJson(Map<String, dynamic> json) {
    return KseIndex(
      indexCode: json['INDEX_CODE'],
      currentIndex: json['CURRENT_INDEX'],
      volumeTraded: json['VOLUME_TRADED'],
      valueTraded: json['VALUE_TRADED'],
      highIndex: json['HIGH_INDEX'],
      lowIndex: json['LOW_INDEX'],
      netChange: json['NET_CHANGE'],
      preClose: json['PreClose'].toDouble(),
      marketStatus: json['MarketStatus'],
    );
  }
}

class KseIndexList {
  final List<KseIndex> data;

  KseIndexList({required this.data});

  // Factory method to create a list of KseIndex objects from JSON
  factory KseIndexList.fromJson(Map<String, dynamic> json) {
    var list = json['d'] as List;
    List<KseIndex> dataList = list.map((i) => KseIndex.fromJson(i)).toList();
    return KseIndexList(data: dataList);
  }
}

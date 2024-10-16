/// company_code : "SPEL"
/// company_name : "Synthetic Products Enterprises Ltd."
/// news_date : "/Date(1728846000000)/"
/// news_desc : "Synthetic Products Enterprises Ltd. (SPEL)\r\nFinancial Results 1st Quarter Results Sep 30, 2024\r\nEPS 1Q = Rs. 1.50\r\nLast 1Q EPS = Re. 0.64\r\n1Q Growth = 131%\r\nInterim Dividend 1Q-25 = Rs. Nil\r\nBonus Shares 1Q-25 = Rs. Nil\r\nCurrent Price = Rs. 34.49\r\nSource: https://dps.psx.com.pk/download/document/239496.pdf"

class Announcement {
  Announcement({
      String? companyCode, 
      String? companyName, 
      String? newsDate, 
      String? newsDesc,}){
    _companyCode = companyCode;
    _companyName = companyName;
    _newsDate = newsDate;
    _newsDesc = newsDesc;
}

  Announcement.fromJson(dynamic json) {
    _companyCode = json['company_code'];
    _companyName = json['company_name'];
    _newsDate = json['news_date'];
    _newsDesc = json['news_desc'];
  }
  String? _companyCode;
  String? _companyName;
  String? _newsDate;
  String? _newsDesc;

  String? get companyCode => _companyCode;
  String? get companyName => _companyName;
  String? get newsDate => _newsDate;
  String? get newsDesc => _newsDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_code'] = _companyCode;
    map['company_name'] = _companyName;
    map['news_date'] = _newsDate;
    map['news_desc'] = _newsDesc;
    return map;
  }

}
/// company_code : "EFUL"
/// company_name : "EFU Life Assurance Ltd.          "
/// news_date : "/Date(1693249200000)/"
/// news_desc : "EFU Life Assurance Ltd.  (EFUL)\r\nHalf Yearly  Results June 30, 2023\r\nEPS 2Q-CY-23 =  Rs. 3.45\r\nEPS Half Yearly-CY-23 = Rs. 8.44\r\nEPS Last Half Yearly-HY-CY-22 = Rs. 6.20\r\nHalf Yearly Growth = 36%\r\nInterim Dividend HY-23 = Rs. 1.50\r\nBonus Shares = HY-23 Nil\r\nCurrent Price = Rs. 190.01\r\nBook Closure Distribution\r\nThe Share Transfer Books of the Company will be Closed\r\nFrom 13/9/2023 To 13/9/2023\r\nSource:https://dps.psx.com.pk/download/document/214073.pdf\r\n"

class News {
  News({
      String? companyCode, 
      String? companyName, 
      String? newsDate, 
      String? newsDesc,}){
    _companyCode = companyCode;
    _companyName = companyName;
    _newsDate = newsDate;
    _newsDesc = newsDesc;
}

  News.fromJson(dynamic json) {
    print('News ${json['company_code']}');
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
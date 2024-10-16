import 'package:flutter/material.dart';
import 'package:scstrade_pro/data/dto/announcement/Announcement.dart';
import 'package:scstrade_pro/data/dto/announcement/Meetings.dart';
import 'package:scstrade_pro/network/api_client.dart';

import '../data/dto/announcement/News.dart';

class AnnouncementProvider extends ChangeNotifier{
  List<News> _news=List.empty(growable: true);
  List<Meetings> _meetings=List.empty(growable: true);
  List<Announcement> _announcement=List.empty(growable: true);
  List<bool> expandable=List.generate(3, (index) => false,);
  bool _isLoading=false;

  bool get isLoading => _isLoading;

  List<News> get news => _news;

  void setExpandable(int index,bool value){
    expandable[index]=value;
    /*for(int i=0;i<expandable.length;i++){
      if(i!=index){
        expandable[i]=!value;
      }
    }*/
    notifyListeners();
  }

  set news(List<News> value) {
    _news = value;
  }

  List<Meetings> get meetings => _meetings;

  set meetings(List<Meetings> value) {
    _meetings = value;
  }

  List<Announcement> get announcement => _announcement;

  set announcement(List<Announcement> value) {
    _announcement = value;
  }

  void fetchAccouncements(){
    try{
      _isLoading=true;
      ApiClient.fetchAccouncements(this);
    }catch(e){
      throw Exception(e);
    }finally{
      _isLoading=false;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>notifyListeners() ,);

    }
  }
}
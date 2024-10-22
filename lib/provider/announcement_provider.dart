import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scstrade_pro/data/dto/announcement/Announcement.dart';
import 'package:scstrade_pro/data/dto/announcement/Meetings.dart';
import 'package:scstrade_pro/network/api_client.dart';

import '../data/dto/announcement/News.dart';
import '../helper/Utils.dart';

class AnnouncementProvider extends ChangeNotifier{
  List<News> _news=List.empty(growable: true);
  List<Meetings> _meetings=List.empty(growable: true);
  List<Announcement> _announcement=List.empty(growable: true);
  List<bool> expandable=List.generate(3, (index) => false,);
  DateTime? _startDate=DateTime.now();
  DateTime? _endDate=DateTime.now();
  bool _isLoading=false;

  bool get isLoading => _isLoading;

  List<News> get news => _news;


  DateTime? get startDate => _startDate;

  set startDate(DateTime? value) {
    _startDate = value;
    notifyListeners();
  }

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

  Future<void> fetchAccouncements() async {
    try{
      for(int i=0;i<expandable.length;i++){
        expandable[i]=false;
      }
      _isLoading=true;
      var responses=await ApiClient.fetchAccouncements();
      List<dynamic> newz=json.decode(responses[0].body);
      List<dynamic> meetingz=json.decode(responses[1].body);
      List<dynamic> announcementz=json.decode(responses[2].body);

      _news = newz.map((e) {
        return  News.fromJson(e);
      },).toList().where((element) {
        return Utils.epochDate(element.newsDate!).isAfter(startDate!) && Utils.epochDate(element.newsDate!).isBefore(endDate!);
      },).toList();
      _meetings = meetingz.map((e) {
        return Meetings.fromJson(e);
      },).toList().where((element) {

        return Utils.epochDate(element.bmDate!).isAfter(startDate!) && Utils.epochDate(element.bmDate!).isBefore(endDate!);
      },).toList();
      announcement = announcementz.map((e) {
        return Announcement.fromJson(e);
      },).toList().where((element) {
        return Utils.epochDate(element.newsDate!).isAfter(startDate!) && Utils.epochDate(element.newsDate!).isBefore(endDate!);
      },).toList();
    }catch(e){
      throw Exception(e);
    }finally{
      _isLoading=false;
      notifyListeners();
      // WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>notifyListeners() ,);

    }
  }

  DateTime? get endDate => _endDate;

  set endDate(DateTime? value) {
    _endDate = value;
    notifyListeners();
  }
}
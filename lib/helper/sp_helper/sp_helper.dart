import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tariq_challenges/model/news_model.dart';

class SharedPreferencesController{
  static late SharedPreferences shared;
  static init() async{
    shared = await SharedPreferences.getInstance();
  }

  // List<NewsModel> news = [];

  static List<String> news = [];

  // Method to add an item to the list
  static Future<void> addItem(String newsItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    news.add(newsItem);
    await prefs.setStringList('myList', news);
  }

  // Method to remove an item from the list
  static Future<void> removeItem(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    news.removeAt(index);
    await prefs.setStringList('myList', news);
  }

  static Future<bool> setData({required String key, required dynamic value}) async
  {
    if(value is String) return shared.setString(key, value);
    if(value is int) return shared.setInt(key, value);
    if(value is bool) return shared.setBool(key, value);
    return shared.setDouble(key, value);
  }

  static dynamic getData({required String key}){
    return shared.get(key);
  }
  static Future<bool> removeData({required String key, required int id}){
    return shared.remove(key);
  }

}
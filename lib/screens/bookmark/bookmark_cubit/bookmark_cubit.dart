import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tariq_challenges/screens/bookmark/bookmark_cubit/bookmark_state.dart';
import '../../../model/news_model.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(HomeInitial());
  List<NewsMyModel> bookmarkedNews = [];
  final String _bookmarksLocalKay = 'savedNews';

  void addToBookmarked(NewsMyModel newsModel) {
    getSavedNewsFromStorage();
    newsModel.isBookmarked = !newsModel.isBookmarked;
    if (newsModel.isBookmarked && !bookmarkedNews.contains(newsModel)) {
      saveNewsToStorage(newsModel);
    } else if (!newsModel.isBookmarked && bookmarkedNews.contains(newsModel)) {
      removeNewsModelFromLocal(newsModel);
    } else {
      debugPrint('This news is Already Bookmarked before');
    }
    emit(AddToBookMarkedState());
  }

  Future<void> saveNewsToStorage(NewsMyModel newsModel) async {
    final pref = await SharedPreferences.getInstance();
    /// jsonEncode بحولي List<Map> to Json example: {key: value}
    /// وهو تنسيق تبادل بيانات خفيف الوزن يسهل على البشر قراءته وكتابته
    final newsJson = jsonEncode(newsModel.toJson());
    final savedNews = pref.getStringList(_bookmarksLocalKay) ?? [];
    savedNews.add(newsJson);
    pref.setStringList(_bookmarksLocalKay, savedNews);
  }

  Future<void> getSavedNewsFromStorage() async {
    final pref = await SharedPreferences.getInstance();
    final savedNews = pref.getStringList(_bookmarksLocalKay) ?? [];

    bookmarkedNews = savedNews.map((newsJson) {
      final newsMap = jsonDecode(newsJson);
      return NewsMyModel.fromJson(newsMap);
    }).toList();
    emit(GetBookMarkedState());
  }

  Future<void> removeNewsModelFromLocal(NewsMyModel newsModel) async {
    final pref = await SharedPreferences.getInstance();
    final newsJsonList = pref.getStringList(_bookmarksLocalKay) ?? [];
    bookmarkedNews = newsJsonList
        .map((jsonString) => NewsMyModel.fromJson(jsonDecode(jsonString)))
        .toList();
    bookmarkedNews.remove(newsModel);
    saveListOfModels(bookmarkedNews);
    emit(RemoveBookMarkedState());
  }

  Future<void> removeAll() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  Future<void> saveListOfModels(List<NewsMyModel> newsModels) async {
    final pref = await SharedPreferences.getInstance();
    final jsonList =
    newsModels.map((model) => jsonEncode(model.toJson())).toList();
    pref.setStringList(_bookmarksLocalKay, jsonList);
  }
}
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tariq_challenges/cubit/states.dart';
import 'package:tariq_challenges/screens/book_mark_screen.dart';
import 'package:tariq_challenges/screens/home_screen.dart';
import 'package:tariq_challenges/screens/profile_screen.dart';

import '../components/constant.dart';
import '../helper/api_helper/dio_helper.dart';
import '../helper/api_helper/google_signin_api.dart';
import '../helper/sp_helper/sp_helper.dart';
import '../model/news_model.dart';
import '../widgets/News_Layout.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  var favoriteItem = news.where((item) => item.isBookmarked == true);
  bool isDarkMoodEnable = false;
  bool model = (SharedPreferencesController.getData(key: 'mood') == null)
      ? true
      : SharedPreferencesController.getData(key: "mood");

  List<dynamic> business = [];

  getBusiness() {
    if (business.length == 0) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'language': 'ar',
        'apiKey': '84437e976459474bbbdbbc4e9aa601d3'
      }).then((value) {
        business = value!.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    if (sports.length == 0) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'language': 'ar',
        'apiKey': '84437e976459474bbbdbbc4e9aa601d3'
      }).then((value) {
        sports = value!.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    if (science.length == 0) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'language': 'ar',
        'apiKey': '84437e976459474bbbdbbc4e9aa601d3'
      }).then((value) {
        science = value!.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> technology = [];

  void getTechnology() {
    if (technology.length == 0) {
      emit(NewsGetTechnologyLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'language': 'ar',
        'apiKey': '84437e976459474bbbdbbc4e9aa601d3'
      }).then((value) {
        technology = value!.data['articles'];
        print(technology[0]['title']);
        emit(NewsGetTechnologySuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetTechnologyErrorState(error.toString()));
      });
    } else {
      emit(NewsGetTechnologySuccessState());
    }
  }

  List<dynamic> general = [];

  void getGeneral() {
    if (general.length == 0) {
      emit(NewsGetGeneralLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'language': 'ar',
        'apiKey': '84437e976459474bbbdbbc4e9aa601d3'
      }).then((value) {
        general = value!.data['articles'];
        print(general[0]['title']);
        emit(NewsGetGeneralSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetGeneralErrorState(error.toString()));
      });
    } else {
      emit(NewsGetGeneralSuccessState());
    }
  }

  void changeMood(value) {
    model = value;
    SharedPreferencesController.setData(key: 'mood', value: model)
        .then((value) {
      emit(Mood());
    });
    print('l mood is $model');
  }

  // void addNews(NewsModel news) {
  //   emit(state..add(news));
  // }
  //
  // void removeNews(NewsModel news) {
  //   emit(state..remove(news));
  // }

  // MenuItemModel currentItem = MenuItems.home;
  // onSelectedItem(item) => currentItem = item;
  int activeIndex = 0;

  void activeIndexIndicator(index, reason) {
    activeIndex = index;
  }

  Future signIn(context) async {
    User.user = await GoogleSignInApi.login();
    if (User.user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sign in Faild")));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => NewsLayout(
                user: User.user,
              )));
    }
  }

  void changeBottomNav(int index, context) {
    currentIndex = index;
    if (index == 2) {
      // Navigator.of(context, rootNavigator: true)
      //     .push(CupertinoPageRoute(
      //     builder: (context) =>
      //         LoggedInScreen(user:User.user,)));
      // navigateTo(context, ProfileScreen(user: User.user,));
      //   containerProfile(User.user, context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfileScreen(
                user: User.user,
              )));
      // MaterialPageRoute(builder: (context) => ProfileScreen()));
    }
    emit(ChangeBottomNavState());
  }

  // Future signIn2() async {
  //   final user = await GoogleSignInApi.login();
  //   // user = await GoogleSignInApi.login();
  // }
  int currentIndex = 0;
  List<Widget> bottomScreen = [
    HomeScreen(),
    BookMarksScreen(),
    ProfileScreen(
      user: User.user,
    )
  ];
  List<String> bottomTitle = ['Home', 'Category', 'Saved News', 'Profile'];

  // List<NewsModel> bookmarkedNews = [];
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

  List<String> savedMyNews = [];

  // Future<void> loadSavedNews() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   savedMyNews = prefs.getStringList('savedNews') ?? [];
  //   // savedMyNews = savedNews;
  // }

  bool isSaved(int index) {
    final id = news[index].hashCode;
    return savedMyNews.contains(id.toString());
  }

  List<NewsMyModel> bookmarkedNews = [];

  Future<void> saveBookmark(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedIds = prefs.getStringList('saved_ids') ?? [];
    if (!savedIds.contains(id.toString())) {
      savedIds.add(id.toString());
      await prefs.setStringList('saved_ids', savedIds);
    }
  }

  Future<void> removeBookmark(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedIds = prefs.getStringList('saved_ids') ?? [];
    if (savedIds.contains(id.toString())) {
      savedIds.remove(id.toString());
      await prefs.setStringList('saved_ids', savedIds);
    }
  }

  Future<List<NewsMyModel>> getBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedIds = prefs.getStringList('saved_ids') ?? [];
    bookmarkedNews =
        news.where((news) => savedIds.contains(news.id.toString())).toList();
    return bookmarkedNews;
  }
}

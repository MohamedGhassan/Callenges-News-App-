abstract class NewsState{}

class InitialNewsState extends NewsState{}
class ChangeBottomNavState extends NewsState{}
class Mood extends NewsState {}

class AddToBookMarkedState extends NewsState {}
class BookMarkedState extends NewsState {}
class GetBookMarkedState extends NewsState {}
class RemoveBookMarkedState extends NewsState {}

class NewsGetBusinessLoadingState extends NewsState {}
class NewsGetBusinessSuccessState extends NewsState {}
class NewsGetBusinessErrorState extends NewsState
{
  final String error;
  NewsGetBusinessErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsState {}
class NewsGetSportsSuccessState extends NewsState {}
class NewsGetSportsErrorState extends NewsState
{
  final String error;
  NewsGetSportsErrorState(this.error);
}
class NewsGetScienceLoadingState extends NewsState {}
class NewsGetScienceSuccessState extends NewsState {}
class NewsGetScienceErrorState extends NewsState
{
  final String error;
  NewsGetScienceErrorState(this.error);
}
class NewsGetTechnologyLoadingState extends NewsState {}
class NewsGetTechnologySuccessState extends NewsState {}
class NewsGetTechnologyErrorState extends NewsState
{
  final String error;
  NewsGetTechnologyErrorState(this.error);
}
class NewsGetGeneralLoadingState extends NewsState {}
class NewsGetGeneralSuccessState extends NewsState {}
class NewsGetGeneralErrorState extends NewsState
{
  final String error;
  NewsGetGeneralErrorState(this.error);
}




part of 'all_news_bloc.dart';

@immutable
abstract class AllNewsState {}

class AllNewsInitial extends AllNewsState {}

class LoadingAllNewsState extends AllNewsState {

  LoadingAllNewsState();
}

// ignore: must_be_immutable
class LoadedAllNewsState extends AllNewsState{
  AllNewsResponse result;

  LoadedAllNewsState(this.result);
}

class ErrorAllNewsState extends AllNewsState {
  final String? message;
  ErrorAllNewsState(this.message);
}
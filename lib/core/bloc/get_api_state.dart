part of 'get_api_bloc.dart';
enum DataEvent { fetchData }
@immutable
sealed class DataState {}

class DataLoading extends DataState {}
class DataEmpty extends DataState {}

class DataLoaded extends DataState {
  final List<Article> data;

  DataLoaded(this.data);
}

class DataError extends DataState {
  final String message;

  DataError(this.message);
}






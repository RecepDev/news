// ignore_for_file: must_be_immutable, prefer_final_fields

part of 'get_api_bloc.dart';

@immutable
sealed class GetApiEvent {}

class FetchData extends GetApiEvent {}

class Search extends GetApiEvent {
  String _searchKey = "";
  Search(this._searchKey);
  String get searchKey => _searchKey;
}

class FetchCategory extends GetApiEvent {
  String _category = "";
  FetchCategory(this._category);
  String get category => _category;
}

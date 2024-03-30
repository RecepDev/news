// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:news/core/api/api_service.dart';
import 'package:news/core/models/article.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, DataState> {
  GetApiBloc() : super(DataLoading()) {
    // ignore: void_checks FetchCategory
    on<FetchData>((event, emit) async {
      try {
        var apiData = await ApiService().getNews();
        emit(DataLoaded(apiData));
      } catch (e) {
        emit(DataError(e.toString()));
      }
    });

    on<FetchCategory>((event, emit) async {
      emit(DataLoading());
      try {
        var apiData = await ApiService().changeCategory(event.category);
        emit(DataLoaded(apiData));
      } catch (e) {
        emit(DataError(e.toString()));
      }
    });
    on<Search>((event, emit) async {
      emit(DataLoading());
      try {
        var apiData = await ApiService().search(event.searchKey);
        if (apiData.isEmpty) {
          emit(DataEmpty());
          return;
        } else {
          emit(DataLoaded(apiData));
        }
      } catch (e) {
        emit(DataError(e.toString()));
      }
    });
  }
}

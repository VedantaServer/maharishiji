import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maharishiji/data/apiClient/api_client.dart';
import 'package:maharishiji/data/models/new-and-events.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class DataLoading extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class DataLoaded extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class DataLoadingError extends NewsEvent {
  @override
  List<Object?> get props => [];
}

//State is Intermediate which hold data during event transitions.

abstract class NewsState extends Equatable {
  const NewsState();
}

class DataLoadingState extends NewsState {
  @override
  List<Object> get props => [];
}

class DataLoadedState extends NewsState {
  @override
  List<Object> get props => [];
}

class DataLoadedSuccess extends NewsState {
  final List<NewsEventsModel> listModel;
  final bool hasReachedMax;
  DataLoadedSuccess(this.listModel, this.hasReachedMax);


  DataLoadedSuccess copyWith({
    List<NewsEventsModel>? listModel,
    bool? hasReachedMax,
  }) {
    return DataLoadedSuccess(this.listModel, this.hasReachedMax);
  }

  @override
  List<Object> get props => [listModel];
}

class DataLoadingErrorState extends NewsState {
  final String msg;
  DataLoadingErrorState(this.msg);
  @override
  List<Object> get props => [msg];
}

//now lets create a block also, whcih will hold both state and events.
class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final _service = ApiClient();

  NewsBloc(NewsState newsState) : super(DataLoadingState()) {
    on<DataLoading>((event, emit) => _callApi(event, emit));
  }

  _callApi(DataLoading event, Emitter<NewsState> emit) async {
    try {

      var partUrl = '/news-and-events/json/min/20/1/20';
      var response = await _service.callApiService(partUrl);

      if (response == null) {
        emit(DataLoadingErrorState('Error while loading Data..'));
      } else {
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        List listOfData = responseJson['data'];
        //if get list from api use List not var here else var use
        var data = listOfData.map((e) => NewsEventsModel.fromJson(e)).toList();

        //emit or send data if found then add else just emit first time.
        emit(DataLoadedSuccess(data, false));
      }
    } catch (error) {
      emit(DataLoadingErrorState('Error while loading Data..'));
    }
  }
}

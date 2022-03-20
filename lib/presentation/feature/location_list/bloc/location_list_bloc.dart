import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_test/domain/model/location.dart';
import 'package:common_test/domain/repository/location_repository.dart';

part 'location_list_bloc.freezed.dart';
part 'location_list_event.dart';
part 'location_list_state.dart';

class LocationListBloc extends Bloc<LocationListEvent, LocationListState> {
  final LocationRepository _repository;
  LocationListBloc(this._repository) : super(LocationListState.loading()) {
    on<Refresh>(
      (event, emit) async {
        emit(LocationListState.loading());
        emit(await _load());
      },
      transformer: restartable(),
    );
    add(const LocationListEvent.refresh());
  }

  Future<LocationListState> _load() async {
    final result = await _repository.getLocationList();
    return result.when(
      success: (loaded, _) => loaded.isEmpty
          ? LocationListState.empty()
          : LocationListState.loaded(
              loaded,
            ),
      error: (msg) {
        return LocationListState.error(msg);
      },
    );
  }
}

part of 'location_list_bloc.dart';

@freezed
class LocationListState with _$LocationListState {
  factory LocationListState.loading() = _Loading;
  factory LocationListState.loaded(
    List<Location> items,
  ) = _Loaded;
  factory LocationListState.empty() = _Empty;
  factory LocationListState.error(String? msg) = _Error;
}

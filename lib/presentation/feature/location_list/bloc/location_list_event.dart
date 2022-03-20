part of 'location_list_bloc.dart';

@freezed
class LocationListEvent with _$LocationListEvent {
  const factory LocationListEvent.refresh() = Refresh;
}

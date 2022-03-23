// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api/location_api.dart' as _i4;
import '../../domain/repository/location_repository.dart' as _i5;
import 'di_module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.getDio());
  gh.factory<Duration>(() => registerModule.getRetryDuration(),
      instanceName: 'RETRY_DURATION');
  gh.factory<String>(() => registerModule.getBaseUrl(),
      instanceName: 'BASE_URL');
  gh.factory<_i4.LocationApi>(() => _i4.LocationApi(get<_i3.Dio>(),
      baseUrl: get<String>(instanceName: 'BASE_URL')));
  gh.factory<_i5.LocationRepository>(() => _i5.LocationRepository(
      get<_i4.LocationApi>(), get<Duration>(instanceName: 'RETRY_DURATION')));
  return get;
}

class _$RegisterModule extends _i6.RegisterModule {}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:common_test/data/model/location_list_response.dart';
import 'package:retrofit/retrofit.dart';

part 'location_api.g.dart';

@injectable
@RestApi()
abstract class LocationApi {
  @factoryMethod
  factory LocationApi(Dio dio, {@Named("BASE_URL") String baseUrl}) = _LocationApi;
  @GET("/sampleData")
  Future<LocationListResponse> getLocationList({
    @Query('page') required int page,
  });
}

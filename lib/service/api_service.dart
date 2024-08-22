import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:testirusri/models/countries_model.dart';
part 'api_service.g.dart';

const testBaseUrl = "https://restcountries.com/v3.1/";
const liveBaseUrl = "https://restcountries.com/v3.1/";

@RestApi(baseUrl: testBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('region/europe')
  Future<List<CountriesModel>> getCountries(@Query("fields") String fields);
}

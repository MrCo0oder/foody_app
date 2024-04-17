import 'package:dio/dio.dart';
import 'package:foody_app/data/constants.dart';
import 'package:foody_app/data/responses/response.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';
@RestApi(baseUrl:ApiConstants.baseUrl)
abstract class AppServiceClient{
  factory AppServiceClient(Dio dio,{String baseUrl}) = _AppServiceClient;

  @POST("customer/login")
  Future<AuthenticationResponse> login(@Field("email" )String email,@Field("password" )String password);
}
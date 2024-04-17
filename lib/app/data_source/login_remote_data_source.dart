import 'package:foody_app/data/requests/Login_body.dart';
import 'package:foody_app/data/responses/response.dart';

import '../../data/network/app_api.dart';

abstract class LoginRemoteDataSource {
  Future<AuthenticationResponse> login(LoginBody loginBody);
}
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final AppServiceClient client;

  LoginRemoteDataSourceImpl( this.client);

  @override
  Future<AuthenticationResponse> login(LoginBody loginBody) async {
    return await client.login(loginBody.email??"",loginBody.password??"");
  }}

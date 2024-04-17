import 'package:dartz/dartz.dart';
import 'package:foody_app/data/requests/Login_body.dart';
import 'package:foody_app/data/responses/failure.dart';
import 'package:foody_app/domain/model/Auth_model.dart';

abstract class Repository{
  Either<Failure,AuthModel> login(LoginBody loginBody);
}
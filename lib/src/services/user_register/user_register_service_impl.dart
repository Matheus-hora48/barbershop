import 'package:barbershop/src/core/exceptions/service_exception.dart';

import 'package:barbershop/src/core/fp/either.dart';

import 'package:barbershop/src/core/fp/nil.dart';

import './user_register_service.dart';

class UserRegisterServiceImpl implements UserRegisterService {
  @override
  Future<Either<ServiceException, Nil>> execute(
      ({
        String email,
        String name,
        String password,
      }) userData) {
        
      }
}

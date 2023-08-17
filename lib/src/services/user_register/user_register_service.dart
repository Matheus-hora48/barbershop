import 'package:barbershop/src/core/exceptions/service_exception.dart';

import '../../core/fp/either.dart';
import '../../core/fp/nil.dart';

abstract interface class UserRegisterService {
  Future<Either<ServiceException, Nil>> execute(
      ({String email, String name, String password}) userData);
}

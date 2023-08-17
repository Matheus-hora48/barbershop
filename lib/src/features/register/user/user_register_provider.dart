import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/services/user_register/user_register_adm_service.dart';
import 'package:barbershop/src/services/user_register/user_register_adm_service_impl.dart';

part 'user_register_provider.g.dart';

UserRegisterAdmService userRegisterAdmService(UserRegisterAdmServiceRef ref) =>
    UserRegisterAdmServiceImpl(
      userRepository: ref.watch(userRepositoryProvider),
      userLoginService: ref.watch(userLoginServiceProvider),
    );

import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/features/auth/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {

  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {
    final loginService = ref.watch(userLoginServiceProvider);
    final result = await loginService.
  }
}
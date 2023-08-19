import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home_adm_state.dart';

part 'home_adm_vm.g.dart';

@riverpod
class HomeAdmVm extends _$HomeAdmVm {
  @override
  Future<HomeAdmState> build() async {
    return HomeAdmState(
      status: HomeAdmStateStatus.loaded,
      employee: [],
    );
  }

  Future<void> logout() => ref.read(logoutProvider.future).asyncLoader();
}

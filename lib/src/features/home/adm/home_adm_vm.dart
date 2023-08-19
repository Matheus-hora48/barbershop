import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/barbershop_model.dart';
import 'home_adm_state.dart';

part 'home_adm_vm.g.dart';

@riverpod
class HomeAdmVm extends _$HomeAdmVm {
  @override
  Future<HomeAdmState> build() async {
    final repository = ref.read(userRepositoryProvider);
    final BarbershopModel(id: barbershopId) = await ref.read(
      getMyBarbershopProvider,
    );

    final employeeResult = await repository.getEmployees(barbershopId);

    switch (employeeResult) {
      case Success(value: final employees):
        return HomeAdmState(
          status: HomeAdmStateStatus.loaded,
          employees: employees,
        );

      case Failure():
        return HomeAdmState(
          status: HomeAdmStateStatus.error,
          employees: [],
        );
    }

    return HomeAdmState(
      status: HomeAdmStateStatus.loaded,
      employees: [],
    );
  }

  Future<void> logout() => ref.read(logoutProvider.future).asyncLoader();
}

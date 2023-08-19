import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/model/user_model.dart';
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
      getMyBarbershopProvider.future,
    );

    final me = await ref.watch(getMeProvider.future);

    final employeeResult = await repository.getEmployee(barbershopId);

    switch (employeeResult) {
      case Success(value: final employeesData):
        final employees = <UserModel>[];

        if (me
            case UserModelADM(
              workDays: _?,
              workHours: _?,
            )) {
          employees.add(me);
        }
        
        employees.addAll(employeesData);
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
  }

  Future<void> logout() => ref.read(logoutProvider.future).asyncLoader();
}

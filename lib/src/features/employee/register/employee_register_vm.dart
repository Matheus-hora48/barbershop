import 'package:barbershop/src/features/employee/register/employee_register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_register_vm.g.dart';

@riverpod
class EmployeeRegisterVm extends _$EmployeeRegisterVm {
  @override
  EmployeeRegisterState build() => EmployeeRegisterState.initial();

  void setRegisterADM(bool isRegisterADM) {
    state = state.copyWith(registerADM: isRegisterADM);
  }

  void addOrRemoveWorkdays(String weekDay) {
    final EmployeeRegisterState(:workdays) = state;

    if (weekDay.contains(weekDay)) {
      workdays.remove(weekDay);
    } else {
      workdays.add(weekDay);
    }

    state = state.copyWith(workdays: workdays);
  }

  void addOrRemoveWorkhours(int hours) {
    final EmployeeRegisterState(:workhours) = state;

    if (workhours.contains(hours)) {
      workhours.remove(hours);
    } else {
      workhours.add(hours);
    }

    state = state.copyWith(workhours: workhours);
  }

  
}

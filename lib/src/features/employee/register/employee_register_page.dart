import 'dart:developer';

import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:barbershop/src/core/ui/widgets/weekdays_panel.dart';
import 'package:barbershop/src/features/employee/register/employee_register_state.dart';
import 'package:barbershop/src/features/employee/register/employee_register_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/widgets/avatar_widget.dart';
import '../../../model/barbershop_model.dart';

class EmployeeRegisterPage extends ConsumerStatefulWidget {
  const EmployeeRegisterPage({super.key});

  @override
  ConsumerState<EmployeeRegisterPage> createState() =>
      _EmployeeRegisterPageState();
}

class _EmployeeRegisterPageState extends ConsumerState<EmployeeRegisterPage> {
  var registerADM = false;

  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employeeRegisterVm = ref.watch(employeeRegisterVmProvider.notifier);
    final barbershopAsyncValue = ref.watch(getMyBarbershopProvider);
    ref.listen(employeeRegisterVmProvider.select((state) => state.status),
        (_, status) {
      switch (status) {
        case EmployeeRegisterStateStatus.initial:
          break;
        case EmployeeRegisterStateStatus.success:
          Messages.showError('Colaborador cadastrado com sucesso', context);
        case EmployeeRegisterStateStatus.error:
          Messages.showError('Erro ao registrar colaborador', context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar colcaborador'),
      ),
      body: barbershopAsyncValue.when(
        data: (barbershopModel) {
          final BarbershopModel(:openingDays, :openingHours) = barbershopModel;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      const AvatarWidget(),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Checkbox.adaptive(
                              value: registerADM,
                              onChanged: (value) {
                                setState(() {
                                  registerADM = !registerADM;
                                  employeeRegisterVm
                                      .setRegisterADM(registerADM);
                                });
                              }),
                          const Expanded(
                            child: Text(
                              'Sou admistrador e quero me cadastrar como colaborador',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                      Offstage(
                        offstage: registerADM,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              controller: nameEC,
                              validator:
                                  Validatorless.required('Nome obrigatório'),
                              decoration: const InputDecoration(
                                label: Text('Nome'),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              controller: emailEC,
                              validator: Validatorless.multiple([
                                Validatorless.required('E-mail obrigatório'),
                                Validatorless.email('E-mail inválido')
                              ]),
                              decoration: const InputDecoration(
                                label: Text('E-mail'),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              controller: passwordEC,
                              validator: Validatorless.multiple([
                                Validatorless.required('Senha obrigatória'),
                                Validatorless.min(
                                  6,
                                  'Senha deve conter pelo menos 6 caracteres',
                                ),
                              ]),
                              decoration: const InputDecoration(
                                label: Text('Senha'),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      WeekdaysPanel(
                        enabledDays: openingDays,
                        onDayPressed: employeeRegisterVm.addOrRemoveWorkdays,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      HoursPanel(
                        startTime: 6,
                        endTime: 23,
                        enabledTimes: openingHours,
                        onHoursPressed: employeeRegisterVm.addOrRemoveWorkhours,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(56)),
                        onPressed: () {
                          switch (formKey.currentState?.validate()) {
                            case false || null:
                              Messages.showError(
                                  'Existem campos inválidos', context);
                            case true:
                              final EmployeeRegisterState(
                                workdays: List(isNotEmpty: hasWorkDays),
                                workhours: List(isNotEmpty: hasWorkHours),
                              ) = ref.watch(
                                employeeRegisterVmProvider,
                              );

                              if (hasWorkDays || hasWorkHours) {
                                Messages.showError(
                                  'Por favor selecione os dias das semana e horário de atendimento',
                                  context,
                                );
                                return;
                              }

                              final name = nameEC.text;
                              final email = emailEC.text;
                              final password = passwordEC.text;

                              employeeRegisterVm.register(
                                name: name,
                                email: email,
                                password: password,
                              );
                          }
                        },
                        child: const Text('Cadastrar colaborador'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        error: (e, s) {
          log('Erro ao carregar a página', error: e, stackTrace: s);
          return const Center(
            child: Text('Erro ao carregar a página'),
          );
        },
        loading: () => const BarbershopLoader(),
      ),
    );
  }
}

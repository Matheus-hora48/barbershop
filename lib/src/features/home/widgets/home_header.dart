import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/core/ui/constants/constants.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/home/adm/home_adm_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/barbershop_icons.dart';

class HomeHeader extends ConsumerWidget {
  final bool showFilter;

  const HomeHeader({super.key}) : showFilter = true;
  const HomeHeader.withoutFilter({super.key}) : showFilter = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final barbershop = ref.watch(getMyBarbershopProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 16),
      height: 400,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(
            ImageConstants.backgroundChair,
          ),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          barbershop.maybeWhen(
            data: (barbershopData) {
              return Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xffbdbdbd),
                    child: SizedBox.shrink(),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Text(
                      barbershopData.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Expanded(
                    child: Text(
                      'editar',
                      style: TextStyle(
                        color: ColorsConstants.brow,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      BarbershopIcons.exit,
                      color: ColorsConstants.brow,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Bem-vindo',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Agende um cliente',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                    ),
                  ),
                  Offstage(
                    offstage: !showFilter,
                    child: const SizedBox(
                      height: 24,
                    ),
                  ),
                  Offstage(
                    offstage: !showFilter,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Buscar Coloborador'),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Icon(
                            BarbershopIcons.search,
                            color: ColorsConstants.brow,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
            orElse: () {
              return const Center(
                child: BarbershopLoader(),
              );
            },
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xffbdbdbd),
                child: SizedBox.shrink(),
              ),
              const SizedBox(
                width: 16,
              ),
              const Flexible(
                child: Text(
                  'Matheus Hora',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Expanded(
                child: Text(
                  'editar',
                  style: TextStyle(
                    color: ColorsConstants.brow,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(homeAdmVmProvider.notifier).logout();
                },
                icon: const Icon(
                  BarbershopIcons.exit,
                  color: ColorsConstants.brow,
                  size: 32,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Bem-vindo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Agende um cliente',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                ),
              ),
              Offstage(
                offstage: !showFilter,
                child: const SizedBox(
                  height: 24,
                ),
              ),
              Offstage(
                offstage: !showFilter,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Buscar Coloborador'),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 24),
                      child: Icon(
                        BarbershopIcons.search,
                        color: ColorsConstants.brow,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

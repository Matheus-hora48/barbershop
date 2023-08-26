import 'package:barbershop/src/core/ui/constants/constants.dart';
import 'package:barbershop/src/core/ui/widgets/avatar_widget.dart';
import 'package:barbershop/src/features/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeEmployee extends StatelessWidget {
  const HomeEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: HomeHeader.withoutFilter(),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const AvatarWidget(
                  hideUpload: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Nome e sobrenome',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * .7,
                  height: 108,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsConstants.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'data',
                        style: TextStyle(
                          fontSize: 32,
                          color: ColorsConstants.brow,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'data',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorsConstants.brow,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Agendar cliente'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Ver agenda'),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

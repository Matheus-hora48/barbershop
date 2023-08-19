import 'package:barbershop/src/core/ui/barbershop_icons.dart';
import 'package:barbershop/src/core/ui/constants/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/home_header.dart';
import 'widget/home_employee_title.dart';

class HomeAdmPage extends StatelessWidget {
  const HomeAdmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(

        ),
        backgroundColor: ColorsConstants.brow,
        onPressed: () {},
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 12,
          child: Icon(
            BarbershopIcons.addEmployee,
            color: ColorsConstants.brow,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const HomeEmployeeTitle(),
              childCount: 20,
            ),
          )
        ],
      ),
    );
  }
}

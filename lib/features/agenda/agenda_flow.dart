import 'package:agenda_app/core/di/di_injectable.dart';
import 'package:agenda_app/features/agenda/add_agenda/add_agenda_page.dart';
import 'package:agenda_app/features/agenda/add_member/add_member_page.dart';
import 'package:agenda_app/features/agenda/agenda_list/agenda_list_page.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/agenda_create_cubit.dart';
import 'bloc/agenda_flow_cubit.dart';

enum AgendaNavState {
  initial,
  addAgenda,
  addMembers,
}

class AgendaFlow extends StatelessWidget {
  const AgendaFlow._();

  static Route<AgendaNavState> route() {
    return MaterialPageRoute(builder: (_) => const AgendaFlow._());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AgendaFlowCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<AgendaCreateCubit>(),
        )
      ],
      child: const FlowBuilder(
        state: AgendaNavState.initial,
        onGeneratePages: onGenerateOnboardingPages,
      ),
    );
  }
}

List<Page<dynamic>> onGenerateOnboardingPages(
  AgendaNavState state,
  List<Page<dynamic>> pages,
) {
  return switch (state) {
    AgendaNavState.initial => [AgendaListPage.page()],
    AgendaNavState.addAgenda => [
        AgendaListPage.page(),
        AddAgendaPage.page(),
      ],
    AgendaNavState.addMembers => [
        AgendaListPage.page(),
        AddAgendaPage.page(),
        AddMemberPage.page(),
      ],
  };
}

class MyPage<T> extends Page<T> {
  const MyPage({required this.child, super.key});

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

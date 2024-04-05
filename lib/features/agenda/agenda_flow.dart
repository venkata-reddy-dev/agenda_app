import 'package:agenda_app/features/agenda/add_agenda/add_agenda.dart';
import 'package:agenda_app/features/agenda/add_member/add_member.dart';
import 'package:agenda_app/features/agenda/agenda_list/agenda_list_page.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

enum AgendaFlowState {
  initial,
  addAgenda,
  addMembers,
}

List<Page<dynamic>> onGenerateOnboardingPages(
  AgendaFlowState state,
  List<Page<dynamic>> pages,
) {
  return switch (state) {
    AgendaFlowState.initial => [AgendaListPage.page()],
    AgendaFlowState.addAgenda => [
        AgendaListPage.page(),
        AddAgendaPage.page(),
      ],
    AgendaFlowState.addMembers => [
        AgendaListPage.page(),
        AddAgendaPage.page(),
        AddMemberPage.page(),
      ],
  };
}

class AgendaFlow extends StatelessWidget {
  const AgendaFlow._();

  static Route<AgendaFlowState> route() {
    return MaterialPageRoute(builder: (_) => const AgendaFlow._());
  }

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      state: AgendaFlowState.initial,
      observers: [HeroController()],
      onGeneratePages: onGenerateOnboardingPages,
    );
  }
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

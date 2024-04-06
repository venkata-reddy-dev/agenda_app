import 'package:agenda_app/features/agenda/agenda_flow.dart';
import 'package:agenda_app/features/agenda/agenda_list/widgets/widgets.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_flow_cubit.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgendaListPage extends StatelessWidget {
  const AgendaListPage._();

  static Page<void> page() => const MyPage<void>(child: AgendaListPage._());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              AppBarWidget(
                title: 'Agenda',
                onBackTap: () => context.flow<AgendaNavState>().complete(),
                onAddAgendaTap: () => context
                    .flow<AgendaNavState>()
                    .update((state) => AgendaNavState.addAgenda),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<AgendaFlowCubit, AgendaFlowState>(
                  builder: (context, state) {
                    return switch (state) {
                      Loading() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      _ => const TabAndBodyWidget(),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/features/agenda/agenda_flow.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_create_cubit.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_flow_cubit.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 62),
              _TitleInputWidget(),
              SizedBox(height: 16),
              _SelectMembersInputWidget(),
              SizedBox(height: 16),
              _DescInputWidget(),
              SizedBox(height: 16),
              SizedBox(height: 200),
              _AddCtaWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleInputWidget extends StatelessWidget {
  const _TitleInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final errorMsg = context
        .select<AgendaCreateCubit, String?>((bloc) => bloc.state.titleErrorMsg);
    return TextFormField(
      onChanged: (_) => context.read<AgendaCreateCubit>().updateTitle(_),
      decoration: InputDecoration(hintText: 'Title *', errorText: errorMsg),
    );
  }
}

class _DescInputWidget extends StatelessWidget {
  const _DescInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final errorMsg = context
        .select<AgendaCreateCubit, String?>((bloc) => bloc.state.titleErrorMsg);
    return TextFormField(
      onChanged: (_) => context.read<AgendaCreateCubit>().updateDesc(_),
      decoration:
          InputDecoration(hintText: 'Description *', errorText: errorMsg),
    );
  }
}

class _SelectMembersInputWidget extends StatelessWidget {
  const _SelectMembersInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.select<AgendaCreateCubit, int>(
        (bloc) => bloc.state.selectedMembersList.length);

    return InkWell(
      onTap: () => context
          .flow<AgendaNavState>()
          .update((state) => AgendaNavState.addMembers),
      child: Row(
        children: [
          const CircleAvatar(
            child: Icon(
              Icons.people,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          const Text('Presenters/Speakers'),
          if (count > 0) ...[
            const SizedBox(width: 16),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 20,
              child: Text(
                '+$count',
                style:
                    context.textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AddCtaWidget extends StatelessWidget {
  const _AddCtaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, foregroundColor: Colors.white),
        onPressed: () {
          final agendaModel = context.read<AgendaCreateCubit>().validateData();
          if (agendaModel == null) {
            return;
          }
          context.read<AgendaFlowCubit>().addAgenda(agendaModel);
        },
        child: const Text('Add'),
      ),
    );
  }
}

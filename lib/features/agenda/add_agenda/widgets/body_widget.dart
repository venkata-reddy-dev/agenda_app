import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/utils/app_colors.dart';
import 'package:agenda_app/features/agenda/add_agenda/widgets/time_input_widget.dart';
import 'package:agenda_app/features/agenda/agenda_flow.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_add_cubit.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_flow_cubit.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
      ),
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 62),
              _TitleInputWidget(),
              SizedBox(height: 16),
              TimeInputWidget(),
              Divider(color: AppColors.divider),
              SizedBox(height: 16),
              _SelectMembersInputWidget(),
              SizedBox(height: 16),
              _DescInputWidget(),
              SizedBox(height: 48),
              _AddCtaWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleInputWidget extends StatelessWidget {
  const _TitleInputWidget();

  @override
  Widget build(BuildContext context) {
    final errorMsg = context
        .select<AgendaAddCubit, String?>((bloc) => bloc.state.titleErrorMsg);
    return TextFormField(
      onChanged: (_) => context.read<AgendaAddCubit>().updateTitle(_),
      decoration: InputDecoration(
        hintText: 'Title *',
        errorText: errorMsg,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.divider),
        ),
      ),
    );
  }
}

class _DescInputWidget extends StatelessWidget {
  const _DescInputWidget();

  @override
  Widget build(BuildContext context) {
    final errorMsg = context
        .select<AgendaAddCubit, String?>((bloc) => bloc.state.descErrorMsg);
    return TextFormField(
      onChanged: (_) => context.read<AgendaAddCubit>().updateDesc(_),
      decoration: InputDecoration(
        hintText: 'Description *',
        errorText: errorMsg,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.divider),
        ),
      ),
    );
  }
}

class _SelectMembersInputWidget extends StatelessWidget {
  const _SelectMembersInputWidget();

  @override
  Widget build(BuildContext context) {
    final count = context.select<AgendaAddCubit, int>(
        (bloc) => bloc.state.selectedMembersList.length);
    final errorMsg = context.select<AgendaAddCubit, String?>(
        (bloc) => bloc.state.selectedMembersErrorMsg);

    return Column(
      children: [
        InkWell(
          onTap: () => context
              .flow<AgendaNavState>()
              .update((state) => AgendaNavState.addMembers),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 24,
                child: Icon(
                  Icons.people,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Presenters/Speakers',
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              if (count > 0) ...[
                const SizedBox(width: 16),
                CircleAvatar(
                  backgroundColor: AppColors.blue,
                  radius: 16,
                  child: Text(
                    '+$count',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: AppColors.white),
                  ),
                ),
              ],
            ],
          ),
        ),
        if (errorMsg != null) ...[
          const SizedBox(height: 12),
          Text(
            errorMsg,
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.red),
          ),
        ],
      ],
    );
  }
}

class _AddCtaWidget extends StatelessWidget {
  const _AddCtaWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final agendaModel = context.read<AgendaAddCubit>().validateData();
          if (agendaModel == null) {
            return;
          }
          context.read<AgendaFlowCubit>().addAgenda(agendaModel);
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            'Add',
            style: context.textTheme.headlineSmall?.copyWith(
              fontSize: 22,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

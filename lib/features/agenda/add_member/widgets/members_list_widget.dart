import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/models/models.dart';
import 'package:agenda_app/core/utils/app_colors.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_create_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberListWidget extends StatelessWidget {
  const MemberListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaCreateCubit, AgendaCreateState>(
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (_, index) =>
              _MemberTileWidget(memberModel: state.membersList[index]),
          separatorBuilder: (_, index) => const Divider(),
          itemCount: state.membersList.length,
        );
      },
    );
  }
}

class _MemberTileWidget extends StatelessWidget {
  const _MemberTileWidget({required this.memberModel});
  final MemberModel memberModel;

  @override
  Widget build(BuildContext context) {
    final isSelected = context.select<AgendaCreateCubit, bool>(
        (bloc) => bloc.state.selectedMembersList.contains(memberModel));

    return ListTile(
      onTap: isSelected
          ? () => context.read<AgendaCreateCubit>().unSelectMember(memberModel)
          : () => context.read<AgendaCreateCubit>().selectMember(memberModel),
      trailing: isSelected
          ? const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
            )
          : null,
      title: Text(
        memberModel.name,
        style:
            context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        memberModel.dob.toFormat(),
        style: context.textTheme.bodyMedium?.copyWith(color: AppColors.grey),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(memberModel.photoUrl),
        radius: 24,
      ),
    );
  }
}

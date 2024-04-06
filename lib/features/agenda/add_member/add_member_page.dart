import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/models/member_model.dart';
import 'package:agenda_app/features/agenda/add_member/widgets/app_bar_widget.dart';
import 'package:agenda_app/features/agenda/agenda_flow.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_create_cubit.dart';
import 'package:agenda_app/features/agenda/widgets/avatars_row_widget.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMemberPage extends StatelessWidget {
  const AddMemberPage._();

  static Page<void> page() => const MyPage<void>(child: AddMemberPage._());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                title: 'Add Member/Guest',
                onBackTap: () => context
                    .flow<AgendaNavState>()
                    .update((state) => AgendaNavState.addAgenda),
              ),
              const SizedBox(height: 8),
              const _SearchInputWidget(),
              const SizedBox(height: 8),
              const _SelectedMembersAvatarWidget(),
              const SizedBox(height: 8),
              const _SelectMembersTitleWidget(),
              const SizedBox(height: 8),
              const Expanded(child: _MemberListWidget()),
              const _CtaWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchInputWidget extends StatelessWidget {
  const _SearchInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search Name ',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}

class _SelectedMembersAvatarWidget extends StatelessWidget {
  const _SelectedMembersAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMembers =
        context.select<AgendaCreateCubit, List<MemberModel>>(
            (bloc) => bloc.state.selectedMembersList);

    if (selectedMembers.isEmpty) {
      return const SizedBox.shrink();
    }

    return AvatarsRowWidget(
        avatarUrlList: selectedMembers.map((e) => e.photoUrl).toList());
  }
}

class _SelectMembersTitleWidget extends StatelessWidget {
  const _SelectMembersTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.select<AgendaCreateCubit, int>(
        (bloc) => bloc.state.selectedMembersList.length);
    final msg = count > 0 ? 'Select Members ($count)' : 'Select Members';
    return Text(
      msg,
      style: context.textTheme.headlineSmall,
    );
  }
}

class _MemberListWidget extends StatelessWidget {
  const _MemberListWidget({super.key});

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
  const _MemberTileWidget({super.key, required this.memberModel});
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
      title: Text(memberModel.name),
      subtitle: Text(memberModel.dob.toFormat()),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(memberModel.photoUrl),
        radius: 30,
      ),
    );
  }
}

class _CtaWidget extends StatelessWidget {
  const _CtaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: () => context
            .flow<AgendaNavState>()
            .update((state) => AgendaNavState.addAgenda),
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}

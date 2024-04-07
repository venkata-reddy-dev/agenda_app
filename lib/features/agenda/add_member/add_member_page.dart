import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/models/member_model.dart';
import 'package:agenda_app/core/utils/app_colors.dart';
import 'package:agenda_app/features/agenda/add_member/widgets/widgets.dart';
import 'package:agenda_app/features/agenda/agenda_flow.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_add_cubit.dart';
import 'package:agenda_app/features/agenda/widgets/avatars_row_widget.dart';
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
                onBackTap: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 8),
              const _SearchInputWidget(),
              const SizedBox(height: 8),
              const _SelectedMembersAvatarWidget(),
              const SizedBox(height: 8),
              const _SelectMembersTitleWidget(),
              const SizedBox(height: 8),
              const Expanded(child: MemberListWidget()),
              const _CtaWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchInputWidget extends StatelessWidget {
  const _SearchInputWidget();

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
  const _SelectedMembersAvatarWidget();

  @override
  Widget build(BuildContext context) {
    final selectedMembers = context.select<AgendaAddCubit, List<MemberModel>>(
        (bloc) => bloc.state.selectedMembersList);

    if (selectedMembers.isEmpty) {
      return Container(
        alignment: Alignment.center,
        height: 64,
        child: const Text('Please Add / Select members'),
      );
    }

    return Card(
      elevation: .3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: AvatarsRowWidget(
          avatarUrlList: selectedMembers.map((e) => e.photoUrl).toList(),
          avatarWidth: 40,
          borderWidth: 2,
        ),
      ),
    );
  }
}

class _SelectMembersTitleWidget extends StatelessWidget {
  const _SelectMembersTitleWidget();

  @override
  Widget build(BuildContext context) {
    final count = context.select<AgendaAddCubit, int>(
        (bloc) => bloc.state.selectedMembersList.length);
    final msg = count > 0 ? 'Select Member ($count)' : 'Select Member';
    return Text(
      msg,
      style: context.textTheme.headlineSmall,
    );
  }
}

class _CtaWidget extends StatelessWidget {
  const _CtaWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.blue),
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.arrow_forward,
          color: AppColors.white,
        ),
      ),
    );
  }
}

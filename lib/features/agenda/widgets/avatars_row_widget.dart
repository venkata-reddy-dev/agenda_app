import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AvatarsRowWidget extends StatelessWidget {
  const AvatarsRowWidget({
    super.key,
    required this.avatarUrlList,
    this.visibleAvatars,
    this.avatarWidth = 60,
    this.avatarVisiblePercentage = 0.6,
    this.borderWidth = 3,
    this.borderColor = Colors.blue,
    this.countInfoWidthPercentage = 0.7,
  });
  final List<String> avatarUrlList;
  final int? visibleAvatars;
  final double avatarWidth;
  final double avatarVisiblePercentage;
  final double borderWidth;
  final Color borderColor;
  final double countInfoWidthPercentage;

  @override
  Widget build(BuildContext context) {
    final maxAvatarVisibleCount = switch (visibleAvatars) {
      int visibleAvatars when (visibleAvatars > avatarUrlList.length) =>
        avatarUrlList.length,
      _ => visibleAvatars ?? avatarUrlList.length,
    };

    return SizedBox(
      height: avatarWidth,
      child: LayoutBuilder(
        builder: (context, boxConstraints) {
          final allImagesWidth = avatarUrlList.length * avatarWidth;
          final isImagesWidthOutOfBounds =
              allImagesWidth > boxConstraints.maxWidth;

          final safeStepsCount = switch (isImagesWidthOutOfBounds) {
            true => _calculateSafeSteps(
                stepWidth: (avatarWidth * avatarVisiblePercentage) + 5,
                steps: avatarUrlList.length,
                maxWidth: boxConstraints.maxWidth),
            false => avatarUrlList.length,
          };

          final finalSafeSteps =
              switch (maxAvatarVisibleCount <= safeStepsCount) {
            true => maxAvatarVisibleCount,
            false => safeStepsCount,
          };

          return Stack(
            children: [
              ...avatarUrlList.sublist(0, finalSafeSteps).mapIndexed(
                (index, url) {
                  return Positioned(
                    key: Key(avatarUrlList[index]),
                    left: index * avatarWidth * avatarVisiblePercentage,
                    child: CircleAvatar(
                      backgroundColor: borderColor,
                      radius: avatarWidth / 2,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(avatarUrlList[index]),
                        radius: (avatarWidth / 2) - borderWidth,
                      ),
                    ),
                  );
                },
              ),
              if (finalSafeSteps < avatarUrlList.length) ...[
                Positioned(
                  left:
                      (finalSafeSteps * avatarWidth * avatarVisiblePercentage),
                  child: CircleAvatar(
                    radius: avatarWidth / 2,
                    backgroundColor: Colors.transparent,
                    child: CircleAvatar(
                      radius: (avatarWidth / 2) * countInfoWidthPercentage,
                      backgroundColor: Colors.blue,
                      child: Text(
                        '+${avatarUrlList.length - finalSafeSteps}',
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

int _calculateSafeSteps({
  required double stepWidth,
  required int steps,
  required double maxWidth,
}) {
  var safeSteps = 0;

  for (int i = 1; i <= steps; i++) {
    if ((i * stepWidth) < maxWidth) {
      safeSteps = i;
    } else {
      return safeSteps;
    }
  }
  return safeSteps;
}

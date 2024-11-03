import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/subscriptions/data/entities/group_entity.dart';
import '../../../core/routes/pages.dart';
import '../../../core/style/colors.dart';

class SubscriptionTile extends StatelessWidget {
  const SubscriptionTile({super.key, required this.subscription});
  final GroupEntity subscription;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(subscription.imageSmall),
      ),
      title: Text(subscription.name),
      subtitle: Text(
        subscription.shortDescription,
        style: const TextStyle(color: AppColors.defaultTextColor),
      ),
      isThreeLine: true,
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.defaultTextColor,
      ),
      onTap: () {
        context.push(
          Routes.details.replaceAll(":slug", subscription.identifier.slug),
        );
      },
    );
  }
}

import 'package:empiricus_subscriptions/app/core/providers/subscriptions/data/entities/group_entity.dart';
import 'package:flutter/material.dart';

import '../../core/providers/subscriptions/datasources/subscriptions_datasource_impl.dart';
import '../../core/providers/subscriptions/repositories/subscriptions_repository_impl.dart';
import '../../core/providers/subscriptions/usecase/get_subscription_by_slug_usecase_impl.dart';
import '../../core/providers/subscriptions/usecase/interfaces/get_subscription_by_slug_usecase.dart';
import '../../core/style/colors.dart';

class DetailsController {
  final GetSubscriptionBySlugUsecase getSubscriptionBySlugUsecase =
      GetSubscriptionBySlugUsecaseImpl(
    repository: SubscriptionsRepositoryImpl(
      datasource: SubscriptionsDatasourceImpl(),
    ),
  );

  final isLoading = ValueNotifier<bool>(false);

  late final GroupEntity subscription;

  void getSubscriptionBySlug(BuildContext context, String slug) async {
    try {
      isLoading.value = true;
      var result = await getSubscriptionBySlugUsecase.call(slug: slug);
      subscription = result;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString().replaceAll("Exception: ", "")),
          backgroundColor: AppColors.secondary,
        ));
      }
    }
  }
}

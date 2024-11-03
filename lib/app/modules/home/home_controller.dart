import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/providers/subscriptions/data/entities/group_entity.dart';

import '../../core/providers/subscriptions/datasources/subscriptions_datasource_impl.dart';
import '../../core/providers/subscriptions/repositories/subscriptions_repository_impl.dart';
import '../../core/providers/subscriptions/usecase/get_subscriptions_usecase_impl.dart';
import '../../core/providers/subscriptions/usecase/interfaces/get_subscriptions_usecase.dart';
import '../../core/style/colors.dart';

class HomeController {
  GetSubscriptionsUsecase getSubscriptionsUsecase = GetSubscriptionsUsecaseImpl(
    repository: SubscriptionsRepositoryImpl(
      datasource: SubscriptionsDatasourceImpl(),
    ),
  );

  final isLoading = ValueNotifier<bool>(false);

  final subscriptions = <GroupEntity>[];

  void getSubscriptions(BuildContext context) async {
    try {
      isLoading.value = true;
      var result = await getSubscriptionsUsecase.getSubscriptions();
      subscriptions.addAll(result.groups);
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

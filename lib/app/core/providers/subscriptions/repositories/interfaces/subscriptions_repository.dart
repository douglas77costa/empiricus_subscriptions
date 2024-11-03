import '../../data/entities/group_entity.dart';
import '../../data/entities/subscriptions_entity.dart';

abstract interface class SubscriptionsRepository {
  Future<SubscriptionsEntity> getSubscriptions();

  Future<GroupEntity> getSubscriptionBySlug({required String slug});
}

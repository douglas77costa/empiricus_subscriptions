import '../../data/entities/subscriptions_entity.dart';

abstract interface class SubscriptionsRepository {
  Future<SubscriptionsEntity> getSubscriptions();
}
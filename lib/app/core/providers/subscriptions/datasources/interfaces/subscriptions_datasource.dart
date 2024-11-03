import '../../data/entities/subscriptions_entity.dart';

abstract interface class SubscriptionsDatasource {
  Future<SubscriptionsEntity> getSubscriptions();
}

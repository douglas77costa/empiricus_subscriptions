import '../../data/entities/subscriptions_entity.dart';

abstract interface class GetSubscriptionsUsecase {
  Future<SubscriptionsEntity> getSubscriptions();
}

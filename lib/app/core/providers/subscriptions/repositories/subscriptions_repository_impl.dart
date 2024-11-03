import '../data/entities/subscriptions_entity.dart';
import '../datasources/interfaces/subscriptions_datasource.dart';
import 'interfaces/subscriptions_repository.dart';

class SubscriptionsRepositoryImpl implements SubscriptionsRepository {
  final SubscriptionsDatasource datasource;

  SubscriptionsRepositoryImpl({required this.datasource});

  @override
  Future<SubscriptionsEntity> getSubscriptions() {
    return datasource.getSubscriptions();
  }
}

import 'package:collection/collection.dart';

import '../data/entities/group_entity.dart';
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

  @override
  Future<GroupEntity> getSubscriptionBySlug({required String slug}) async {
    try {
      var subscriptions = await datasource.getSubscriptions();
      var subscription = subscriptions.groups
          .firstWhereOrNull((element) => element.identifier.slug == slug);
      if (subscription == null) {
        throw Exception('Assinatura não encontrada');
      }
      return subscription;
    } catch (e) {
      rethrow;
    }
  }
}

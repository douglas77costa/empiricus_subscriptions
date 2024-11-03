import '../data/entities/subscriptions_entity.dart';
import '../repositories/interfaces/subscriptions_repository.dart';
import 'interfaces/get_subscriptions_usecase.dart';

class GetSubscriptionsUsecaseImpl implements GetSubscriptionsUsecase {
  final SubscriptionsRepository repository;

  GetSubscriptionsUsecaseImpl({required this.repository});

  @override
  Future<SubscriptionsEntity> getSubscriptions() {
    return repository.getSubscriptions();
  }
}

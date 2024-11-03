import '../data/entities/group_entity.dart';
import '../repositories/interfaces/subscriptions_repository.dart';
import 'interfaces/get_subscription_by_slug_usecase.dart';

class GetSubscriptionBySlugUsecaseImpl implements GetSubscriptionBySlugUsecase {
  final SubscriptionsRepository repository;

  GetSubscriptionBySlugUsecaseImpl({required this.repository});

  @override
  Future<GroupEntity> call({required String slug}) {
    return repository.getSubscriptionBySlug(slug: slug);
  }
}

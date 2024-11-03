import '../../data/entities/group_entity.dart';

abstract interface class GetSubscriptionBySlugUsecase {
  Future<GroupEntity> call({required String slug});
}

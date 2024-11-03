import 'package:json_annotation/json_annotation.dart';

import '../entities/group_entity.dart';
import '../entities/subscriptions_entity.dart';
import 'group_model.dart';

part 'subscriptions_model.g.dart';

@JsonSerializable(createToJson: false)
class SubscriptionsModel extends SubscriptionsEntity {
  SubscriptionsModel({required List<GroupModel> groups})
      : super(groups: groups);

  @override
  List<GroupEntity> get groups => super.groups as List<GroupModel>;

  factory SubscriptionsModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionsModelFromJson(json);
}

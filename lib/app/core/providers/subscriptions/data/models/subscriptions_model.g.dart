// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionsModel _$SubscriptionsModelFromJson(Map<String, dynamic> json) =>
    SubscriptionsModel(
      groups: (json['groups'] as List<dynamic>)
          .map((e) => GroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

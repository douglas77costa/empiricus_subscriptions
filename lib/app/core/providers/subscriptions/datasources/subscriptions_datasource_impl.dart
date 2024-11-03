import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/entities/subscriptions_entity.dart';
import '../data/models/subscriptions_model.dart';
import 'interfaces/subscriptions_datasource.dart';

class SubscriptionsDatasourceImpl implements SubscriptionsDatasource {
  @override
  Future<SubscriptionsEntity> getSubscriptions() async {
    try {
      var response = await http.get(
        Uri.parse("https://empiricus-app.empiricus.com.br/mock/list.json"),
      );
      if (response.statusCode == 200) {
        return SubscriptionsModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        throw Exception("Erro ao buscar dados");
      }
    } catch (e) {
      rethrow;
    }
  }
}

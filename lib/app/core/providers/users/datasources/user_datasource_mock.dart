import 'package:collection/collection.dart';

import '../data/entities/user_entity.dart';
import 'interfaces/user_datasource.dart';

class UserDatasourceMock implements UserDatasource {
  @override
  Future<UserEntity> loginUser(
      {required String email, required String password}) async {
    var users = await getUsers();
    var user = users.firstWhereOrNull(
        (user) => user.email == email && user.password == password);
    await Future.delayed(const Duration(seconds: 1));
    if (user == null) {
      throw Exception('Senha ou e-mail incorretos');
    } else {
      return user;
    }
  }

  @override
  Future<List<UserEntity>> getUsers() {
    return Future.value([
      UserEntity(
        name: 'Teste',
        email: 'teste@teste.com',
        password: '123456',
      )
    ]);
  }
}

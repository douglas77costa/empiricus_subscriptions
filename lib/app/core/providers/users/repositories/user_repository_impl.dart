import '../data/entities/user_entity.dart';
import '../datasources/interfaces/user_datasource.dart';
import 'interfaces/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl({required this.datasource});

  @override
  Future<UserEntity> loginUser({required String email, required String password}) {
    return datasource.loginUser(email: email, password: password);
  }
}
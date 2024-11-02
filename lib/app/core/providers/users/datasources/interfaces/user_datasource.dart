import '../../data/entities/user_entity.dart';

abstract interface class UserDatasource {
  Future<UserEntity> loginUser({required String email, required String password});
  Future<List<UserEntity>> getUsers();
}
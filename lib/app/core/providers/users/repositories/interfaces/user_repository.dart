import '../../data/entities/user_entity.dart';

abstract interface class UserRepository {
  Future<UserEntity> loginUser({required String email, required String password});
}
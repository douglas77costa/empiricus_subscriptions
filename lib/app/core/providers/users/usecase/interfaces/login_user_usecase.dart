import '../../data/entities/user_entity.dart';

abstract interface class LoginUserUseCase {
  Future<UserEntity> call({required String email, required String password});
}
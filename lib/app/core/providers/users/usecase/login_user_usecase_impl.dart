import '../data/entities/user_entity.dart';
import '../repositories/interfaces/user_repository.dart';
import 'interfaces/login_user_usecase.dart';

class LoginUserUseCaseImpl implements LoginUserUseCase {
  final UserRepository userRepository;

  LoginUserUseCaseImpl({required this.userRepository});

  @override
  Future<UserEntity> call({required String email, required String password}) {
    return userRepository.loginUser(email: email, password: password);
  }

}
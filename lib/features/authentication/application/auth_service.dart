import 'package:ecommerce/app/locator.dart';
import 'package:ecommerce/features/authentication/data/DTOs/login_dto.dart';
import 'package:ecommerce/features/authentication/data/auth_repository.dart';
import 'package:ecommerce/features/authentication/domain/user.dart';
import 'package:ecommerce/shared_preferences/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final AuthRepositoryType authRepository;

  AuthService({required this.authRepository});
  final sfService = serviceLocator<SharedPreferencesService>();

  Future<User> loginWithUsernameAndPassword(String username, String password) async {
    final dto = LoginDto(username: username, password: password);
    final response = await authRepository.login(dto);
    sfService.token = response.accessToken ?? "";
    final user = User(id: response.id,
     username: response.username, 
     email: response.email, 
     firstName: response.firstName, 
     lastName: response.lastName,
     gender: response.gender,
     image: response.image);

     return user;
  }
}
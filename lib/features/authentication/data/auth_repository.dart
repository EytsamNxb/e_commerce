import 'package:ecommerce/features/authentication/data/DTOs/login_dto.dart';
import 'package:ecommerce/features/authentication/data/network_routes/routes.dart';
import 'package:ecommerce/features/authentication/data/response_models/user_model.dart';
import 'package:ecommerce/network/url_request.dart';

abstract class AuthRepositoryType {
  Future<UserModel> login(LoginDto dto);
}

class AuthRepository implements AuthRepositoryType{
  final _request = UrlRequest();
  @override
  Future<UserModel> login(LoginDto dto) async {
    final requestBody = dto.toJson();
    final routeInput = RouterInput(body: requestBody);
    final json = await _request.makeNetworkRequest(Routes.login, routeInput);
    final mapToDict = json as Map<String, dynamic>;
    final response = UserModel.fromJson(mapToDict);
    return Future.value(response);
  }
  
}
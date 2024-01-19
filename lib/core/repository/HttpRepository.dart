// En core/repository/http_repository.dart
abstract class HttpRepository {
  Future<dynamic> get(String path);
// Define métodos adicionales para POST, PUT, DELETE si son necesarios
}

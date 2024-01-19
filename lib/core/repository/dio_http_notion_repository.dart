import 'package:dio/dio.dart';
import 'package:monymonky/core/network/remote/api_dio_client_notion.dart';
import 'package:monymonky/core/repository/repository.dart';


class DioHttpNotionRepository implements HttpRepository {
  final APIDioClientNotion _dioClient;

  DioHttpNotionRepository(this._dioClient);

  @override
  Future<dynamic> get(String path) async {
    try {
      final response = await _dioClient.dio.get(path);
      return response.data;
    } on DioException catch (e) {
      // Manejar el error
      throw Exception('Error al realizar la petición GET: $e');
    }
  }

// Implementa los métodos POST, PUT, DELETE usando _dioClient.instance
}

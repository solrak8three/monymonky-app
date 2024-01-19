import 'package:dio/dio.dart';
import 'package:monymonky/core/network/network.dart';


class APIDioClientNotion {
  late Dio dio;
  APIDioClientNotion() : dio = DioClient().createDio(baseUrl: 'https://www.codigozen.es/api/notion');
}


/*
class APIDioClientAnother {
  late Dio dio;
  APIDioClientNotion() : dio = DioClient.createDio(baseUrl: 'https://example.com ');
}
*/

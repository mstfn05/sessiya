import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/Info.dart';
import 'package:retrofit/http.dart';

part 'info_repository.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class InfoRepository {
  factory InfoRepository(Dio dio, {String baseUrl}) = _InfoRepository;

  @GET("/posts/1")
  Future<Info> getPost();
}

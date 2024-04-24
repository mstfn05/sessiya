import 'package:flutter_application_1/model/data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'data_repository.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class DataApi {
  factory DataApi(Dio dio, {String baseUrl}) = _DataApi;

  @GET("/posts")
  Future<List<Data>> getPosts();
}

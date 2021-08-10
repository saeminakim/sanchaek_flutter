import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:sanchaek/models/bookModel.dart';

part 'client.g.dart';

const protocol = 'http';
const host = '192.168.45.171:5000';

@RestApi()
abstract class Client {
  factory Client.create() => _Client(
        Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: token != null
                ? {
                    "Authorization": 'Bearer $token',
                  }
                : {},
          ),
        ),
      );

  static CookieJar cookieJar = CookieJar();

  static get baseUrl {
    return "$protocol://$host";
  }

  static String token;

  @GET("/books")
  Future<BookModel> books(
    @Query("keyword") String keyword,
  );
}
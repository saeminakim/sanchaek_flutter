import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:sanchaek/models/bookModel.dart';
import 'package:sanchaek/models/wishListModel.dart';

part 'client.g.dart';

const protocol = 'http';

const host = '192.168.45.166:8080';
// const host = '192.168.45.233:8080';
// const host = '172.30.1.49:8080';

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
  Future<List<BookModel>> books(
    @Query("query") String keyword,
  );

  @POST("/wishlist")
  Future addWishList(
    @Body() BookModel book,
  );

  @GET("/wishlist")
  Future<List<BookModel>> getWishList();
}

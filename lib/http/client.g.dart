// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _Client implements Client {
  _Client(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<BookModel> books(keyword) async {
    ArgumentError.checkNotNull(keyword, 'keyword');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'keyword': keyword};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/books',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BookModel.fromJson(_result.data);
    return value;
  }
}

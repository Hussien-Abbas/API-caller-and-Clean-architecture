// ignore_for_file: file_names, unused_element

import 'package:breakingbad_api/Constants/Strings.dart';
import 'package:dio/dio.dart';

class CharactersApi {
  late Dio dio;
  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response respone = await dio.get('character');
      return respone.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

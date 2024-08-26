import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  late Response response;
         String baseUrl = 'http://192.168.43.93:8000/api/';
        // String baseUrl = 'https://f0b5-185-177-126-128.ngrok-free.app/api/';
     
  
   static  const String  imageurl = 'http://192.168.43.93:8000/';
    // static  const String  imageurl = 'https://f0b5-185-177-126-128.ngrok-free.app';
  
}
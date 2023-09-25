import 'dart:async';
import 'package:dio/dio.dart';


mixin AppDio on Dio {
  
  static Future<Dio> getInstance(
      {bool useToken = false,
      bool sendElectronicSignature = false,
      int? customSendTimeout,
      int? customReceiveTimeout}) async {
 
    final Dio dio = Dio();
    final Map<String, String> headers = Map<String, String>();
    headers['Authorization'] =  'Basic ' + 'algum base64 ou algo assim'; //para caso precise de authorization mas sem token
    headers['api-key'] = 'fkIw3JcN38shLOd83';

    if (useToken) {
      headers['Authorization'] = 'Bearer ' + 'valor do token'; // se usar Bearer
    }

    dio.options = BaseOptions();
    dio.options.receiveTimeout = Duration(seconds: customReceiveTimeout ?? 30000);
    dio.options.sendTimeout = Duration(seconds: customSendTimeout ?? 15000);

    dio.options.headers = headers;

    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) {
    //     return true;
    //   };
    // }; 
    //para esse certificado eh necessario baixar a lib clientAdapter do dio

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          //se precisar interceptar algo no request
        },
        onResponse: onResponse,
        onError: (error, handler) async {
          await onError(dio, error, handler);
        },
      ),
    );

    return dio;
  }

  static void onRequest(RequestOptions options) {
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    //se precisar interceptar algo no request conteudo
  }

  static void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
     //se precisar interceptar algo no request conteudo
    handler.next(response);
  }

  static Future<dynamic> onError(Dio dio, DioError error, ErrorInterceptorHandler handler) async {
    
    //se precisar interceptar algo no erro exemplo :

    if (error.response?.statusCode == 401) {
    }

    if (error.response?.statusCode == 404) {
    }
  }
}

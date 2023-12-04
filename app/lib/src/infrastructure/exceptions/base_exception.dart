import 'package:app/src/infrastructure/exceptions/comunication_exception.dart';
import 'package:app/src/modules/home/services/log/log_service.dart';

class BaseException<T> implements Exception{

  final LogService _logger = LogService();

  final String? message;
  final String? nameClass;
  final String? type;
  final T? exception;

  BaseException([this.message, this.nameClass, this.type, this.exception]) {
    
    if(type == 'error') {
      _logger.logError();
    }

    if(type == 'warning') {
      _logger.logWarning();
    }

    toStringMessage();

  }

  String toStringMessage() {

    if(exception == Exception) {
      print('Treta de Exception');
      return 'Treta de Exception';
    }

    if(exception == ComunicationException) {
      print('Treta de Comunicação');
      print(nameClass);
      return 'Treta de Comunicação';
    }
    
    return "BaseException: erro Desconhecido";

  }
}
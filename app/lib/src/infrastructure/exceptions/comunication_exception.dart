import 'package:app/src/infrastructure/exceptions/base_exception.dart';

class ComunicationException extends BaseException{

  final String? nameClass;

  ComunicationException({this.nameClass}):super("message", nameClass, "error", ComunicationException);

}
import 'package:app/src/infrastructure/exceptions/base_exception.dart';

class ComunicationException extends BaseException{

  ComunicationException():super("message", "error", ComunicationException);

}
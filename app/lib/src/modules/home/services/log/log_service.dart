class LogService{


  Future<void> logError() async {

    try{
      //faz a criação do log de erro no arquivo específico
    }catch(e){
      rethrow;
    }

  }

  Future<void> logWarning() async {

    try{
      //faz a criação do log de informação no arquivo específico
    }catch(e){
      rethrow;
    }

  }

}
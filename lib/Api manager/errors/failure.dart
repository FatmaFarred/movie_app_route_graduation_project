 class Failure {
 String ? errorMessage;
 Failure ({required this.errorMessage});

}


class serverError extends Failure {

  serverError ({required super.errorMessage});

}

class NetworkError extends Failure {

  NetworkError ({required super.errorMessage});

}


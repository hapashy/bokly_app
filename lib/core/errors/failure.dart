import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout api server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout api server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout api server');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate api server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to api server Canceld');
      case DioExceptionType.connectionError:
        return ServerFailure(' No Internet Connection ');
      case DioExceptionType.unknown:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');

    }else if (statusCode == 500)
    {
      return ServerFailure('There is a problem with server, please try later');
    }else if (statusCode == 400 || statusCode == 401 || statusCode == 403 )
    {
            return ServerFailure(response['error']['massage']);

    }else {
              return ServerFailure('There was an Error, Please try again');

    }
  }
}

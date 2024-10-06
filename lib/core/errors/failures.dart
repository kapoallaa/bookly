import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;
  Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with apiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with apiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with apiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('BadCerticate with apiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error to ApiServer was canceld');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try later ');
      default:
        return ServerFailure('Opps There was an Error, Please try later');
    }
  }
  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('your request not found , please try later !');
    } else if (statusCode == 500) {
      return ServerFailure('Internet Server error , please try later !');
    } else {
      return ServerFailure('Opps there was an error , please try later');
    }
  }
}

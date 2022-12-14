import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:simlk_app/src/services/wrapper/base_response.dart';

import 'network_exception.dart';

class ErrorHandler {
  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.connectTimeout:
              networkExceptions = error.response?.data['message'] != null
                  ? NetworkExceptions.defaultError(
                      error.response?.data['message'])
                  : NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = error.response?.data['message'] != null
                  ? NetworkExceptions.defaultError(
                      error.response?.data['message'])
                  : NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 400:
                  networkExceptions = error.response?.data['message'] != null
                      ? NetworkExceptions.defaultError(
                          error.response?.data['message'])
                      : NetworkExceptions.unauthorisedRequest();
                  break;
                case 401:
                  networkExceptions = error.response?.data['message'] != null
                      ? NetworkExceptions.defaultError(
                          error.response?.data['message'])
                      : NetworkExceptions.unauthorisedRequest();
                  break;
                case 403:
                  networkExceptions = NetworkExceptions.unauthorisedRequest();
                  break;
                case 404:
                  networkExceptions = error.response?.data['message'] != null
                      ? NetworkExceptions.defaultError(
                          error.response?.data['message'])
                      : NetworkExceptions.notFound("Not found");
                  break;
                case 405:
                  networkExceptions = NetworkExceptions.methodNotAllowed();
                  break;
                case 409:
                  networkExceptions = NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = NetworkExceptions.requestTimeout();
                  break;
                case 422:
                  networkExceptions = error.response?.data['message'] != null
                      ? NetworkExceptions.defaultError(
                          error.response?.data['message'])
                      : NetworkExceptions.badRequest();
                  break;
                case 500:
                  networkExceptions = error.response?.data['message'] != null
                      ? NetworkExceptions.defaultError(
                          error.response?.data['message'])
                      : NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions = NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response?.statusCode;
                  networkExceptions = error.response?.data['message'] != null
                      ? NetworkExceptions.defaultError(
                          error.response?.data['message'])
                      : NetworkExceptions.defaultError(
                          "Received invalid status code: $responseCode",
                        );
              }
              break;
            case DioErrorType.cancel:
              networkExceptions = NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.other:
              networkExceptions = NetworkExceptions.noInternetConnection();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        // Helper.printError(e.toString());
        return NetworkExceptions.formatException();
      } catch (_) {
        return NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return error.response?.data['message'] != null
            ? NetworkExceptions.defaultError(error.response?.data['message'])
            : NetworkExceptions.unableToProcess();
      } else {
        return NetworkExceptions.defaultError(error.toString());
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "Bad request";
    }, unauthorisedRequest: () {
      errorMessage = "Unauthorised request";
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    });
    return errorMessage;
  }
}

extension FutureAPIResultExt<T extends BaseResponse> on Future<T> {
  Future<T> validateStatus() {
    return then((value) async {
      final code = value.status;
      final message = value.message;
      // You can use this if has multiple domain url and separate the error
      // final domain = value.domain;
      // debugPrint("DOMAIN => $domain");

      if (code >= 200 && code <= 299) return value;
      if (code == 401) {}
      throw message;
    });
  }
}

extension FutureExt<T> on Future<T> {
  Future<T> summarizeError() {
    return catchError((error) async {
      throw ErrorHandler.getErrorMessage(ErrorHandler.getDioException(error));
    });
  }

  Future<T> handleError(Function onError) async {
    return summarizeError().catchError(onError);
  }
}

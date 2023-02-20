
import 'package:untitled3/core/network/error_message_model.dart';

class ServiceExceptions implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServiceExceptions({required this.errorMessageModel});
}

class LocalExceptions implements Exception{
  final String message;

  LocalExceptions({required this.message});
}
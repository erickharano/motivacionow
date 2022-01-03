import 'package:core/core.dart';

class PersonageMapperError extends Failure {
  PersonageMapperError({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );

  @override
  String toString() {
    return "PersonageMapperError: $message";
  }
}

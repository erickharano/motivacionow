import 'failure.dart';

class DataSourceError extends Failure {
  DataSourceError({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

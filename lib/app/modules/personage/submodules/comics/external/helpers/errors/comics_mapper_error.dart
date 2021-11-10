import '../../../../../../core/helpers/errors/failure.dart';

class ComicsMapperError extends Failure {
  ComicsMapperError({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

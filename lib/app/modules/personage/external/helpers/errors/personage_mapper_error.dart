import '../../../../core/helpers/errors/failure.dart';

class PersonageMapperError extends Failure {
  PersonageMapperError({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

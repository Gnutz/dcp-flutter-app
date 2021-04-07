import 'package:digtial_costume_platform/domain/core/failures.dart';

class UnExpectedValueError extends Error {
  final ValueFailure value;

  UnExpectedValueError({required this.value});

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was $value');
  }
}
class Failure implements Exception {
  bool isWarning;
  String title;
  String message;
  String primaryAction;
  String? secondaryAction;

  Failure({
    this.isWarning = true,
    this.title = "Erro",
    this.message = "Tente novamente mais tarde",
    this.primaryAction = "OK",
  });

  @override
  String toString() => '$runtimeType Exception';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure &&
        other.isWarning == isWarning &&
        other.title == title &&
        other.message == message &&
        other.primaryAction == primaryAction &&
        other.secondaryAction == secondaryAction;
  }

  @override
  int get hashCode {
    return isWarning.hashCode ^
        title.hashCode ^
        message.hashCode ^
        primaryAction.hashCode ^
        secondaryAction.hashCode;
  }
}

class GenericFailure extends Failure {}

class TimeoutFailure extends Failure {}

class ApiFailure extends Failure {}

class PlatformFailure extends Failure {
  final String code;

  PlatformFailure({
    String? message,
    required this.code,
  }) : super(
            message: message ??
                'Ocorreu um erro inesperado no servidor, tente novamente');
}

class MessageFailure extends Failure {
  final String msg;

  MessageFailure(this.msg);
}

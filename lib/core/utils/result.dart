import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

class Result<T> extends Equatable {
  final T? _data;
  final Failure? _failure;

  const Result.success(this._data) : _failure = null;

  const Result.failure(this._failure) : _data = null;

  bool get isSuccess => _data != null;

  T get data => _data!;

  Failure get error => _failure!;

  void when({
    required Function(T) success,
    required Function(Failure) failure,
  }) {
    if (_data != null) {
      success(data);
    } else {
      failure(error);
    }
  }

  @override
  List<Object?> get props => [_data, _failure];
}

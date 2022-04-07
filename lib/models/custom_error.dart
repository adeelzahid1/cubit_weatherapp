import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String errMsg;
  CustomError({required this.errMsg});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [errMsg];
}

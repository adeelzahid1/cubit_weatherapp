
class CustomError {
  final String errMsg;
  CustomError({this.errMsg = '',});

  bool get stringify => true;

  List<Object> get props => [errMsg];
}

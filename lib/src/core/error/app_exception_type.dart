enum AppExceptionType {
  general('Bir şeyler yanlış gitti');

  const AppExceptionType(this.message);

  final String message;
}

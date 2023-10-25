// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerException implements Exception {
  ServerException(this.message);

  final String? message;

  @override
  bool operator ==(covariant ServerException other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

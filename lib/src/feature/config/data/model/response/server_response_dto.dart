// ignore_for_file: public_member_api_docs, sort_constructors_first

class DataResponseDto {
  final bool? success;
  final List<String>? messages;
  final Map<String, dynamic>? data;
  final int? status;

  DataResponseDto({
    this.success,
    this.messages,
    this.data,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'messages': messages,
      'data': data,
      'status': status,
    };
  }

  factory DataResponseDto.fromMap(Map<String, dynamic> map) {
    return DataResponseDto(
      success: map['success'] != null ? map['success'] as bool : null,
      messages: map['messages'] != null
          ? List<String>.from(map['messages'] as List<dynamic>)
          : null,
      data: map['data'] != null
          ? Map<String, dynamic>.from(map['data'] as Map<String, dynamic>)
          : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }
}

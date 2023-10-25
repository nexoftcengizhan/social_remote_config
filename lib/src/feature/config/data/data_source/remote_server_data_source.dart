import 'package:dio/dio.dart';
import 'package:social_remote_config/src/core/error/server_exception.dart';
import 'package:social_remote_config/src/feature/config/data/model/request/update_values_request.dart';
import 'package:social_remote_config/src/feature/config/data/model/response/server_response_dto.dart';
import 'package:social_remote_config/src/feature/config/presentation/model/enum/config_enum.dart';
import 'package:social_remote_config/src/utils/constants/api_constants.dart';

abstract class IRemoteServerDataSource {
  Future<void> updateValues(UpdateValuesRequestDto request);

  Future<Map<ConfigType, dynamic>> getValues();
}

class RemoteServerDataSource implements IRemoteServerDataSource {
  RemoteServerDataSource(this._dio);

  final Dio _dio;

  @override
  Future<void> updateValues(UpdateValuesRequestDto request) async {
    final response = await _dio.put(
      ApiConstants.updateValues,
      data: request.valueMap,
    );

    final responseDto = DataResponseDto.fromMap(response.data);

    if (responseDto.status == 200) {
      if (responseDto.data != null) {
        return;
      } else {
        throw ServerException(responseDto.messages?.first);
      }
    } else {
      throw ServerException(responseDto.messages?.first);
    }
  }

  @override
  Future<Map<ConfigType, dynamic>> getValues() async {
    final response = await _dio.put(
      ApiConstants.getValues,
    );

    final responseDto = DataResponseDto.fromMap(response.data);

    if (responseDto.status == 200) {
      if (responseDto.data != null) {
        return {};
      } else {
        throw ServerException(responseDto.messages?.first);
      }
    } else {
      throw ServerException(responseDto.messages?.first);
    }
  }
}

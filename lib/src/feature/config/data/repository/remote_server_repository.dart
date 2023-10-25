import 'package:dartz/dartz.dart';
import 'package:social_remote_config/src/core/error/app_exception_type.dart';
import 'package:social_remote_config/src/feature/config/data/data_source/remote_server_data_source.dart';
import 'package:social_remote_config/src/feature/config/data/model/request/update_values_request.dart';
import 'package:social_remote_config/src/feature/config/presentation/model/enum/config_enum.dart';

abstract class IRemoteServerRepo {
  Future<Either<AppExceptionType, void>> updateValues(
    UpdateValuesRequestDto requestDto,
  );

  Future<Either<AppExceptionType, Map<ConfigType, dynamic>>> getValues();
}

class RemoteServiceRepo implements IRemoteServerRepo {
  RemoteServiceRepo(this._remoteServerDs);

  final IRemoteServerDataSource _remoteServerDs;

  @override
  Future<Either<AppExceptionType, void>> updateValues(
    UpdateValuesRequestDto requestDto,
  ) async {
    try {
      final response = _remoteServerDs.updateValues(requestDto);
      return Right(response);
    } catch (e) {
      return const Left(AppExceptionType.general);
    }
  }

  @override
  Future<Either<AppExceptionType, Map<ConfigType, dynamic>>> getValues() async {
    try {
      final response = await _remoteServerDs.getValues();
      return Right(response);
    } catch (e) {
      return const Left(AppExceptionType.general);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:social_remote_config/src/feature/config/data/data_source/remote_server_data_source.dart';
import 'package:social_remote_config/src/feature/config/data/repository/remote_server_repository.dart';
import 'package:social_remote_config/src/feature/config/data/service/remote_server_service.dart';

import '../network/app_dio.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(AppDio());
  getIt.registerSingleton<IRemoteServerDataSource>(
    RemoteServerDataSource(getIt()),
  );
  getIt.registerSingleton<IRemoteServerRepo>(RemoteServiceRepo(getIt()));
  getIt.registerSingleton<RemoteServerService>(RemoteServerService(getIt()));
}

import 'package:bot_toast/bot_toast.dart';
import 'package:social_remote_config/src/feature/config/data/model/request/update_values_request.dart';
import 'package:social_remote_config/src/feature/config/data/repository/remote_server_repository.dart';
import 'package:social_remote_config/src/feature/config/presentation/model/enum/config_enum.dart';

class RemoteServerService {
  RemoteServerService(this._remoteServerRepo);

  final IRemoteServerRepo _remoteServerRepo;

  Future<void> updateValues(UpdateValuesRequestDto requestDto) async {
    await _remoteServerRepo.updateValues(requestDto);
  }

  Future<Map<ConfigType, dynamic>?> getValues() async {
    final response = await _remoteServerRepo.getValues();
    return response.fold((l) {
      BotToast.showText(text: 'Değerler server\'dan çekilirken hata oluştu.');
      return null;
    }, (r) {
      return r;
    });
  }
}

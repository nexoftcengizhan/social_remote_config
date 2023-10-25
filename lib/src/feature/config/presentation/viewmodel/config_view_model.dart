import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_remote_config/src/feature/config/data/model/request/update_values_request.dart';
import 'package:social_remote_config/src/feature/config/data/service/remote_server_service.dart';
import 'package:social_remote_config/src/feature/config/presentation/model/enum/config_enum.dart';
import 'package:social_remote_config/src/feature/config/presentation/model/config_value_model.dart';

import '../../../../core/di/di.dart';

final configProvider = ChangeNotifierProvider<ConfigViewModel>((ref) {
  return ConfigViewModel(getIt());
});

class ConfigViewModel extends ChangeNotifier {
  ConfigViewModel(this.remoteService);

  bool isMock = true;

  final RemoteServerService remoteService;

  final textController = TextEditingController();

  List<ConfigModel> initialValues = [];
  List<ConfigModel> updatedValues = [];

  Future<void> init() async {
    isFetching = true;
    final values = isMock ? _dbValues : await remoteService.getValues();

    if (values != null) {
      initialValues = values.entries.map((entry) {
        return ConfigModel(entry.key, entry.value);
      }).toList();

      updatedValues = initialValues
          .map<ConfigModel>((e) => e.copyWith(type: e.type, value: e.value))
          .toList();
    }
    isFetching = false;
  }

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  set isFetching(bool value) {
    _isFetching = value;
    notifyListeners();
  }

  bool isChanged(ConfigType type) {
    return initialItemOf(type).value != updatedItemOf(type).value;
  }

  bool get isAnyValueUpdated {
    final anyChanged = initialValues.any(
      (element) {
        return element.value != updatedItemOf(element.type).value;
      },
    );
    return anyChanged;
  }

  ConfigType? editingType;

  bool isEditing(ConfigType type) {
    return type == editingType;
  }

  void setIsEditing(ConfigType value) {
    editingType = value;
    notifyListeners();
  }

  void updateValue<T>(ConfigType type, T newValue) {
    updatedItemOf(type).value = newValue;
    notifyListeners();
  }

  void reset(ConfigType type) {
    updatedItemOf(type).value = initialItemOf(type).value;
    notifyListeners();
  }

  ConfigModel updatedItemOf(ConfigType type) {
    return updatedValues.firstWhere((element) => element.type == type);
  }

  ConfigModel initialItemOf(ConfigType type) {
    return initialValues.firstWhere((element) => element.type == type);
  }

  void closeAllEditings() {
    editingType = null;
    notifyListeners();
  }

  bool _isUpdating = false;

  bool get isUpdating => _isUpdating;

  set isUpdating(bool value) {
    _isUpdating = value;
    notifyListeners();
  }

  Future<void> updateValues() async {
    if (_isUpdating) return;
    _isUpdating = true;
    await remoteService.updateValues(
      UpdateValuesRequestDto.fromList(updatedValues),
    );
    _isUpdating = false;
  }
}

final _dbValues = <ConfigType, dynamic>{
  ConfigType.AccessTokenExpirationMinutes: 60,
  ConfigType.RefreshTokenExpirationMinutes: 12000,
  ConfigType.RefreshTokenLength: 32,
  ConfigType.EmailVerificationCodeLength: 4,
  ConfigType.EmailVerificationCodeExpirationMinutes: 2,
  ConfigType.EmailVerificationCodeTTLInMinutes: 5,
  ConfigType.RefreshTokenExpirationMinutesGoogle: 2147483647,
  ConfigType.MaxFileSize: 8000000,
  ConfigType.PaginationMaxTake: 100,
  ConfigType.PaginationMinTake: 1,
  ConfigType.AppCodes: [
    "YB",
    "PE",
    "HS",
    "BW",
    "WF",
    "LM",
    "HWM",
    "DE",
    "BM",
    "SPL",
    "AEM",
    "AEW",
    "LH",
    "WL",
    "SE",
    "WM",
    "YWL",
    "LW",
    "AE",
    "FY",
    "wt"
  ],
  ConfigType.SumByTypes: ["calories"],
  ConfigType.TimeTypes: ["daily", "monthly", "weekly", "All"],
  ConfigType.RankingListCacheExpirationMinutes: 2,
  ConfigType.RankingCacheWorkerIntervalMinutes: 1,
  ConfigType.CacheDuration: 60000,
  ConfigType.CacheRefreshInterval: 60000,
  ConfigType.CacheDurationDelay: 10000,
  ConfigType.TotalSampleCount: 10,
  ConfigType.LastActivityMinuteRange: 100,
  ConfigType.LastActivityMinuteRangeIncement: 100,
  ConfigType.LastActivityMinimumDay: 7,
  ConfigType.GroupMaximumAllowedUserCount: 2000,
  ConfigType.MaximumAllowedCreateGroupCount: 10,
  ConfigType.MaximumAllowedSendMessageToOtherUserPerDay: 10,
  ConfigType.ChatMessageGroupIcon: "✉️",
  ConfigType.CustomPlanLastDayCount: 3,
  ConfigType.ChatMessageUserIcon: "✉️",
  ConfigType.MaimumAllowedChallengeRequestPerDay: 10,
  ConfigType.AllowUnconfirmedEmail: false,
  ConfigType.AppOpenedChallengeMaxAllowedSendForNotification: 100,
  ConfigType.AppOpenedGroupMaxAllowedSendForNotification: 100,
  ConfigType.ChallengeAcceptedMaxAllowedSendForNotification: 100,
  ConfigType.ChallengeCompletedMaxAllowedSendForNotification: 100,
  ConfigType.ChallengeRequestMaxAllowedSendForNotification: 100,
  ConfigType.FollowMaxAllowedSendForNotification: 100,
  ConfigType.GroupAddMaxAllowedSendForNotification: 100,
  ConfigType.LikedCustomPlanMaxAllowedSendForNotification: 100,
  ConfigType.SendAppOpenedGroupNotification: true,
  ConfigType.SendAppOpenedChallengeNotification: true,
  ConfigType.SendMessageNotification: true,
  ConfigType.SendFollowNotification: true,
  ConfigType.SendGroupAddNotification: true,
  ConfigType.SendChallengeCompletedNotification: true,
  ConfigType.SendChallengeRequestNotification: true,
  ConfigType.SendChallengeAcceptedNotification: true,
  ConfigType.SendLikedCustomPlanNotification: true,
  ConfigType.RankingLimit: 10
};

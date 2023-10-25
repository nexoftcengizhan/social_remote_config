// ignore_for_file: constant_identifier_names

enum ConfigType {
  AccessTokenExpirationMinutes('AccessTokenExpirationMinutes'),
  RefreshTokenExpirationMinutes('RefreshTokenExpirationMinutes'),
  RefreshTokenLength('RefreshTokenLength'),
  EmailVerificationCodeLength('EmailVerificationCodeLength'),
  EmailVerificationCodeExpirationMinutes(
      'EmailVerificationCodeExpirationMinutes'),
  EmailVerificationCodeTTLInMinutes('EmailVerificationCodeTTLInMinutes'),
  RefreshTokenExpirationMinutesGoogle('RefreshTokenExpirationMinutesGoogle'),
  MaxFileSize('MaxFileSize'),
  PaginationMaxTake('PaginationMaxTake'),
  PaginationMinTake('PaginationMinTake'),
  AppCodes('AppCodes'),
  SumByTypes('SumByTypes'),
  TimeTypes('TimeTypes'),
  RankingListCacheExpirationMinutes('RankingListCacheExpirationMinutes'),
  RankingCacheWorkerIntervalMinutes('RankingCacheWorkerIntervalMinutes'),
  CacheDuration('CacheDuration'),
  CacheRefreshInterval('CacheRefreshInterval'),
  CacheDurationDelay('CacheDurationDelay'),
  TotalSampleCount('TotalSampleCount'),
  LastActivityMinuteRange('LastActivityMinuteRange'),
  LastActivityMinuteRangeIncement('LastActivityMinuteRangeIncement'),
  LastActivityMinimumDay('LastActivityMinimumDay'),
  GroupMaximumAllowedUserCount('GroupMaximumAllowedUserCount'),
  MaximumAllowedCreateGroupCount('MaximumAllowedCreateGroupCount'),
  MaximumAllowedSendMessageToOtherUserPerDay(
      'MaximumAllowedSendMessageToOtherUserPerDay'),
  ChatMessageGroupIcon('ChatMessageGroupIcon'),
  CustomPlanLastDayCount('CustomPlanLastDayCount'),
  ChatMessageUserIcon('ChatMessageUserIcon'),
  MaimumAllowedChallengeRequestPerDay('MaimumAllowedChallengeRequestPerDay'),
  AllowUnconfirmedEmail('AllowUnconfirmedEmail'),
  AppOpenedChallengeMaxAllowedSendForNotification(
      'AppOpenedChallengeMaxAllowedSendForNotification'),
  AppOpenedGroupMaxAllowedSendForNotification(
      'AppOpenedGroupMaxAllowedSendForNotification'),
  ChallengeAcceptedMaxAllowedSendForNotification(
      'ChallengeAcceptedMaxAllowedSendForNotification'),
  ChallengeCompletedMaxAllowedSendForNotification(
      'ChallengeCompletedMaxAllowedSendForNotification'),
  ChallengeRequestMaxAllowedSendForNotification(
      'ChallengeRequestMaxAllowedSendForNotification'),
  FollowMaxAllowedSendForNotification('FollowMaxAllowedSendForNotification'),
  GroupAddMaxAllowedSendForNotification(
      'GroupAddMaxAllowedSendForNotification'),
  LikedCustomPlanMaxAllowedSendForNotification(
      'LikedCustomPlanMaxAllowedSendForNotification'),
  SendAppOpenedGroupNotification('SendAppOpenedGroupNotification'),
  SendAppOpenedChallengeNotification('SendAppOpenedChallengeNotification'),
  SendMessageNotification('SendMessageNotification'),
  SendFollowNotification('SendFollowNotification'),
  SendGroupAddNotification('SendGroupAddNotification'),
  SendChallengeCompletedNotification('SendChallengeCompletedNotification'),
  SendChallengeRequestNotification('SendChallengeRequestNotification'),
  SendChallengeAcceptedNotification('SendChallengeAcceptedNotification'),
  SendLikedCustomPlanNotification('SendLikedCustomPlanNotification'),
  RankingLimit('RankingLimit');

  const ConfigType(this.description);

  final String description;
}

import 'package:social_remote_config/src/feature/config/presentation/model/config_value_model.dart';

class UpdateValuesRequestDto {
  UpdateValuesRequestDto({
    required this.valueMap,
  });

  Map<String, dynamic> valueMap;

  factory UpdateValuesRequestDto.fromList(List<ConfigModel> updatedValues) {
    return UpdateValuesRequestDto(
      valueMap: Map.fromEntries(updatedValues.map((e) {
        return MapEntry(e.type.name, e.value);
      })),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:social_remote_config/src/feature/config/presentation/model/enum/config_enum.dart';

class ConfigModel<T> extends Equatable {
  ConfigModel(this.type, this.value);

  final ConfigType type;
  T value;

  @override
  List<Object?> get props => [type, value];

  ConfigModel copyWith({ConfigType? type, T? value}) {
    return ConfigModel(type ?? this.type, value ?? this.value);
  }
}

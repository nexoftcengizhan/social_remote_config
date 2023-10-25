import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_remote_config/src/feature/config/presentation/model/config_value_model.dart';
import 'package:social_remote_config/src/feature/config/presentation/viewmodel/config_view_model.dart';
import 'package:social_remote_config/src/utils/extensions/context_extension.dart';

import '../../../theme/constants/colors.dart';

class ConfigView extends ConsumerWidget {
  const ConfigView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configVM = ref.read(configProvider)..init();
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            configVM.closeAllEditings();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const ConfigList(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(bottom: 24.h, right: 24.w),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Redis Server Güncelle'),
            ),
          ),
        ),
      ],
    );
  }
}

class ConfigList extends ConsumerWidget {
  const ConfigList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ...ref.watch(configProvider).updatedValues.mapIndexed((index, config) {
          final isFirst = index == 0;
          final isLast =
              index == ref.read(configProvider).initialValues.length - 1;
          return Padding(
            padding: EdgeInsets.only(
              top: isFirst ? 100.h : 20.h,
              bottom: isLast ? 200.h : 20.h,
            ),
            child: ConfigTile(config: config),
          );
        }).toList()
      ],
    );
  }
}

class ConfigTile extends ConsumerStatefulWidget {
  const ConfigTile({
    Key? key,
    required this.config,
  }) : super(key: key);

  final ConfigModel config;

  @override
  ConsumerState<ConfigTile> createState() => _ConfigTileState();
}

class _ConfigTileState extends ConsumerState<ConfigTile> {
  final textController = TextEditingController();
  late final key = ValueKey<String>(configType.name);
  late final configVM = ref.read(configProvider);
  late final configType = widget.config.type;
  late final config = widget.config;

  @override
  void initState() {
    super.initState();
    textController.text = widget.config.value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40.r),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 2,
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.config.type.name,
                  style: context.bodyText2?.copyWith(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                26.verticalSpace,
                Text(
                  widget.config.type.description,
                  style: context.bodyText2?.copyWith(fontSize: 32.sp),
                ),
              ],
            ),
          ),
          const Spacer(),
          ref.watch(
                  configProvider.select((value) => value.isChanged(configType)))
              ? IconButton(
                  onPressed: () {
                    configVM.reset(configType);
                  },
                  icon: const Icon(Icons.restore_sharp))
              : const SizedBox.shrink(),
          Builder(builder: (context) {
            final value = widget.config.value;
            if (value is String || value is int) {
              final isNum = value is int;
              return InkWell(
                onTap: () {
                  configVM.setIsEditing(widget.config.type);
                },
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 40.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      color: Colors.grey.withOpacity(.1),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                    child:
                        ref.watch(configProvider).isEditing(widget.config.type)
                            ? IntrinsicWidth(
                                child: TextFormField(
                                  autofocus: true,
                                  controller: textController,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: AppColors.olive,
                                        width: 2,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  style: context.bodyText2?.copyWith(
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  onChanged: (String text) {
                                    final numericValue = int.tryParse(text);
                                    configVM.updateValue(configType,
                                        isNum ? numericValue ?? 0 : text);
                                  },
                                  keyboardType: isNum
                                      ? TextInputType.number
                                      : TextInputType.text,
                                ),
                              )
                            : Text(
                                '${widget.config.value}',
                                style: context.bodyText2?.copyWith(
                                  fontSize: 36.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                  ),
                ),
              );
            } else if (value is bool) {
              return DropdownButton<bool>(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                value: widget.config.value,
                selectedItemBuilder: (context) {
                  return [
                    Center(
                      child: Text(
                        '${widget.config.value}',
                        style: context.bodyText2?.copyWith(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ];
                },
                items: [
                  DropdownMenuItem<bool>(
                    value: widget.config.value,
                    child: Text('${widget.config.value}'),
                  ),
                  DropdownMenuItem<bool>(
                    value: !widget.config.value,
                    child: Text(
                      '${!widget.config.value}',
                    ),
                  ),
                ],
                onChanged: (bool? newValue) {
                  configVM.updateValue(configType, newValue);
                },
              );
            }
            return Text(config.value.toString());
          }),
        ],
      ),
    );
  }
}

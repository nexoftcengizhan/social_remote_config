import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_remote_config/src/feature/config/presentation/view/config_view.dart';
import 'package:social_remote_config/src/feature/theme/constants/colors.dart';
import 'package:social_remote_config/src/utils/extensions/context_extension.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Nexoft Remote Config',
          style: context.bodyText2?.copyWith(
            color: Colors.black,
            fontSize: 44.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: AppColors.wheat,
      ),
      // drawer: const AppDrawer(),
      body: const Center(child: ConfigView()),
    );
  }
}

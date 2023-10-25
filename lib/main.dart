import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_remote_config/src/core/di/di.dart';
import 'package:social_remote_config/src/feature/home/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const NexoftRemoteConfig());
}

class NexoftRemoteConfig extends StatelessWidget {
  const NexoftRemoteConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(1440, 2560),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          final botToastBuilder = BotToastInit();
          return MaterialApp(
            title: 'Nexoft Remote Config',
            debugShowCheckedModeBanner: false,
            home: child,
            builder: (context, child) {
              child = botToastBuilder(context, child);
              return child;
            },
            navigatorObservers: [BotToastNavigatorObserver()],
          );
        },
        child: const HomeView(),
      ),
    );
  }
}

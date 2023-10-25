import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  // Locale get locale => EasyLocalization.of(this)!.locale;

  Size get size => MediaQuery.of(this).size;

  //// If landscape returns width otherwise returns height if smaller than 700
  bool get isHeightSmall {
    if (isLandscape) {
      return size.width < 700;
    }
    return size.height < 700;
  }

  bool get isWidthSmall => size.width < 400;
  double get width => size.width;
  double get height => size.height;

  /// Height (without SafeArea)
  EdgeInsets get paddingOfSafearea => MediaQuery.of(this).viewPadding;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  double get heightWithoutSafearea =>
      height - paddingOfSafearea.top - paddingOfSafearea.bottom;

  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// Height (without status bar)

  double get heightWithoutStatusbar => height - paddingOfSafearea.top;

  /// Height (without status and toolbar)

  double get heightWithoutStatusAndAppbar =>
      height - paddingOfSafearea.top - kToolbarHeight;

  bool get isLandscape {
    return MediaQuery.of(this).orientation == Orientation.landscape;
  }

  bool get isPortrait {
    return MediaQuery.of(this).orientation == Orientation.portrait;
  }

  bool get isTablet {
    return MediaQuery.of(this).size.shortestSide >= 600;
  }

  double heightByRatio(double ratio) => height * ratio;
  double widthByRatio(double ratio) => width * ratio;

  double widthPercentage(double percentage) => width * percentage;
  double heightPercentage(double percentage) => height * percentage;

  double widthToMax(double maxWidth, double ratio) {
    return width * ratio > maxWidth ? maxWidth : width * ratio;
  }

  double heightToMax(double maxHeight, double ratio) {
    return height * ratio > maxHeight ? maxHeight : height * ratio;
  }

  double widthToMaxLimitToDevice(double maxWidth, double ratio) {
    final double result = width * ratio > maxWidth ? maxWidth : width * ratio;
    return result > width ? width : result;
  }

  double heightToMaxLimitToDevice(double maxHeight, double ratio) {
    final double result =
        height * ratio > maxHeight ? maxHeight : height * ratio;
    return result > height ? height : result;
  }

  double getSafeWidth(double safeWidth) =>
      width > safeWidth ? safeWidth : width;

  double dynamicWidth(
    double smallScreenPercentage,
    double bigScreenPercentage,
  ) {
    return width * (isWidthSmall ? smallScreenPercentage : bigScreenPercentage);
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
  TextStyle? get bodyText1 => textTheme.bodyText1;
  TextStyle? get bodyText2 => textTheme.bodyText2;
  TextStyle? get headline1 => textTheme.headline1;
  TextStyle? get headline2 => textTheme.headline2;
  TextStyle? get headline3 => textTheme.headline3;
  TextStyle? get headline4 => textTheme.headline4;
  TextStyle? get headline5 => textTheme.headline5;
  TextStyle? get headline6 => textTheme.headline6;
  TextStyle? get subtitle1 => textTheme.subtitle1;
  TextStyle? get subtitle2 => textTheme.subtitle2;

  Color get primaryColor => theme.primaryColor;
}

extension NavigatorExtension on BuildContext {
  Future<T?> pushAndRemoveUntil<T extends Object?, TO extends Object?>(
    Widget page,
  ) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  void popUntilRoot() {
    Navigator.of(this).popUntil((route) {
      return route.isFirst;
    });
  }
}

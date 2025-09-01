import 'package:learning_go_test/src/core/extensions/assets_extension.dart';

class AppImages {
  static const String _assetsImagesPath = 'assets/images';
  String get assetImagesPath => _assetsImagesPath;
  static String appLogo = 'an_app_logo.gif'.asAssetsImage;
  static String appSlug = 'im_app_slug.png'.asAssetsImage;
}

class AppIcons {
  static const String _assetsIconsPath = 'assets/icons';
  String get assetsIconsPath => _assetsIconsPath;
}

class AppLottie {
  static const String _assetsLottiePath = 'assets/lotties';
  String get assetsLottiePath => _assetsLottiePath;
  static String error = 'error.json'.asAssetsLottie;
  static String loading = 'loading.json'.asAssetsLottie;
  static String success = 'success.json'.asAssetsLottie;
  static String successIcon = 'ic_success_white.json'.asAssetsLottie;
  static String loadingIcon = 'ic_loading_white.json'.asAssetsLottie;
  static String loadingWhite = 'ic_loading_white.json'.asAssetsLottie;
  static String successWhite = 'ic_success_white.json'.asAssetsLottie;
}

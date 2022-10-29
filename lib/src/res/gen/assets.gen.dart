/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  $LibSrcGen get src => const $LibSrcGen();
}

class $LibSrcGen {
  const $LibSrcGen();

  $LibSrcResGen get res => const $LibSrcResGen();
}

class $LibSrcResGen {
  const $LibSrcResGen();

  $LibSrcResImagesGen get images => const $LibSrcResImagesGen();
}

class $LibSrcResImagesGen {
  const $LibSrcResImagesGen();

  /// File path: lib/src/res/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('lib/src/res/images/app_logo.png');

  /// File path: lib/src/res/images/data_empty.png
  AssetGenImage get dataEmpty =>
      const AssetGenImage('lib/src/res/images/data_empty.png');

  /// File path: lib/src/res/images/notification_empty.png
  AssetGenImage get notificationEmpty =>
      const AssetGenImage('lib/src/res/images/notification_empty.png');

  /// List of all assets
  List<AssetGenImage> get values => [appLogo, dataEmpty, notificationEmpty];
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

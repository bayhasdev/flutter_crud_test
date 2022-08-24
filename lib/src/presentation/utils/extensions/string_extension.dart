import '../../../core/constants/constants.dart';
import 'date_extension.dart';

extension DateTimeFormat on String {
  String? dateForamt({String foramt = kDateFormat}) {
    return toDateTime()?.dateForamt(foramt: foramt);
  }

  DateTime? toDateTime() => DateTime.tryParse(this);
}

extension AssetsPath on String {
  String get svgPath => kAssetSvgBase + this;
  String get imagesPath => kAssetsImageBase + this;
  String get iconsPath => kAssetsIconBase + this;
}

extension ImageSplits on String {
  List<String> get imageList => split(',');
}

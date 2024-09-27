import 'package:new_weedus/export.dart';

class LandingMainBannerBuildWidget {
  static const int _durationValue = 500;
  static const Duration _duration = Duration(milliseconds: _durationValue);

  static Widget build(
          BuildContext context, LandingMainBannerViewModel viewModel) =>
      AnimatedSwitcher(
          duration: _duration,
          child: Image.asset(
              viewModel.landingBannerList[viewModel.currentIndex1],
              key: ValueKey<int>(viewModel.currentIndex1)));
}

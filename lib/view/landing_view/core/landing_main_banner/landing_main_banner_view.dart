import 'package:new_weedus/export.dart';

class LandingMainBannerView extends StatefulWidget {
  const LandingMainBannerView({super.key});

  @override
  State<LandingMainBannerView> createState() => _LandingMainBannerViewState();
}

class _LandingMainBannerViewState extends State<LandingMainBannerView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LandingMainBannerViewModel viewModel =
          Provider.of<LandingMainBannerViewModel>(context, listen: false);
      if (mounted) {
        viewModel.startTimer();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    LandingMainBannerViewModel viewModel =
        Provider.of<LandingMainBannerViewModel>(context, listen: false);
    if (mounted) viewModel.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LandingMainBannerViewModel viewModel =
        Provider.of<LandingMainBannerViewModel>(context);
    return LandingMainBannerBuildWidget.build(context, viewModel);
  }
}

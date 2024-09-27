import 'package:new_weedus/export.dart';

class _PromoDateBannerConstants {
  _PromoDateBannerConstants._();

  static final String _fontFamily = 'TitanOne';
  static final double _fontSize = 20;
  static final int _duration = 6;
  static const String? _topHeaderTitle1 = 'GET 25% OFF YOUR FIRST ORDER';
  static const String? _topHeaderTitle2 = 'UP TO 40%  OFF VALID';

}

class PromoDateBanner extends StatelessWidget {
  const PromoDateBanner({Key? key, required this.promoDates}) : super(key: key);
  final String promoDates;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
        sticky: true,
        header: Container(
            width: context.width,
            height: kToolbarHeight,
            color: appColor,
            child: PromoBannerClickableText(promoDates: promoDates)));
  }
}

class PromoBannerClickableText extends StatelessWidget {
  const PromoBannerClickableText({Key? key, required this.promoDates})
      : super(key: key);
  final String promoDates;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
            onTap: () {},
            child: DefaultTextStyle(
                style: TextStyle(
                    fontSize: _PromoDateBannerConstants._fontSize,
                    fontFamily: _PromoDateBannerConstants._fontFamily),
                child: AnimatedTextKit(
                    repeatForever: true,
                    pause:
                        Duration(seconds: _PromoDateBannerConstants._duration),
                    animatedTexts: [
                      TyperAnimatedText(
                          _PromoDateBannerConstants._topHeaderTitle1!),
                      TyperAnimatedText(
                          '${_PromoDateBannerConstants._topHeaderTitle2!} $promoDates')
                    ]))));
  }
}

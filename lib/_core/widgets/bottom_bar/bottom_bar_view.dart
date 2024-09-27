import 'package:new_weedus/export.dart';

class _BottomBarConstants {
  _BottomBarConstants._();

  static final double _viewSize = 220.0;
  static final double _fontSize = 30.0;
  static final double _iconSize = 25;
  static const String _appName = 'weedus';
  static const String _linkedInPath = 'assets/app/insta.svg';
  static const String _twitterPath = 'assets/app/Twitter.svg';
  static const String _facebookPath = 'assets/app/fb.svg';
  static const String _appLogoPath = 'assets/app/background-leaf2.png';
  static List<String> _socialList = [
    _linkedInPath,
    _twitterPath,
    _facebookPath
  ];
  static final EdgeInsetsGeometry _padding =
      EdgeInsets.only(top: defaultSize, left: 60);
  static const String _titleCompany = 'Company ';
  static const String _titleAbout = 'About';
  static const String _titleCareers = 'Careers';
  static const String _titleContact = 'Contact';
  static const String _titleDispensaries = 'Dispensaries';
  static const String _titleHome = 'Home';
  static const String _titlePointOfSale = 'Point of Sale';
  static const String _titleEcommerce = 'Ecommerce';
  static const String _titleResources = 'Resources';
  static const String _titleBlog = 'Blog';
  static const String _titleProductUpdates = 'Product Updates';
  static const String _titleReferADispensary = 'Refer a Dispensary';
}

class BottomBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList = [
      _BlackBottomBarColumn(isLogoWidget: true),
      _BlackBottomBarColumn(
          heading: _BottomBarConstants._titleCompany,
          s1: _BottomBarConstants._titleAbout,
          s2: _BottomBarConstants._titleCareers,
          s3: _BottomBarConstants._titleContact),
      _BlackBottomBarColumn(
          heading: _BottomBarConstants._titleDispensaries,
          s1: _BottomBarConstants._titleHome,
          s2: _BottomBarConstants._titlePointOfSale,
          s3: _BottomBarConstants._titleEcommerce),
      _BlackBottomBarColumn(
          heading: _BottomBarConstants._titleResources,
          s1: _BottomBarConstants._titleBlog,
          s2: _BottomBarConstants._titleProductUpdates,
          s3: _BottomBarConstants._titleReferADispensary)
    ];
    return Container(
        padding: EdgeInsets.all(defaultSize),
        color: nero,
        child: _grid(context, list: _widgetList));
  }

  Widget _grid(BuildContext context, {List<Widget>? list}) {
    return ResponsiveGridList(
        shrinkWrap: true,
        minSpacing: defaultSize,
        desiredItemWidth: _BottomBarConstants._viewSize,
        rowMainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(list!.length, (index) => list[index]));
  }
}

class _BlackBottomBarColumn extends StatelessWidget {
  final String? heading;
  final String? s1;
  final String? s2;
  final String? s3;
  final bool? isLogoWidget;

  _BlackBottomBarColumn(
      {this.heading, this.s1, this.s2, this.s3, this.isLogoWidget = false});

  @override
  Widget build(BuildContext context) {
    return isLogoWidget!
        ? appNameLogo()
        : Padding(
            padding: _BottomBarConstants._padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textWidget(title: heading!, isHeader: true),
                _heightSizedBox,
                _textWidget(title: s1!, onTap: () {}),
                _halfHeightSizedBox,
                _textWidget(title: s2!, onTap: () {}),
                _halfHeightSizedBox,
                _textWidget(title: s3!, onTap: () {})
              ],
            ));
  }

  Widget _textWidget(
          {required String title, VoidCallback? onTap, bool? isHeader}) =>
      SizedBox(
          width: _BottomBarConstants._viewSize,
          child: UnderLineTextHover(
              title: title, onTap: onTap, isHeader: isHeader ?? false));

  Widget get _heightSizedBox => SizedBox(height: defaultSize);

  Widget get _halfHeightSizedBox => SizedBox(height: halfDefaultSize);

  Widget appNameLogo() {
    return SizedBox(
        width: _BottomBarConstants._viewSize,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: quarterDefaultSize),
                  child: Image.asset(_BottomBarConstants._appLogoPath,
                      height: _BottomBarConstants._fontSize)),
              SizedBox(width: halfDefaultSize),
              Column(children: [
                Text(_BottomBarConstants._appName, style: _style),
                SizedBox(height: halfDefaultSize),
                Row(
                    children: List.generate(
                        _BottomBarConstants._socialList.length,
                        (index) => Row(children: [
                              _socialLogo(
                                  _BottomBarConstants._socialList[index]),
                              index !=
                                      _BottomBarConstants._socialList.length - 1
                                  ? SizedBox(width: doubleDefaultSize)
                                  : SizedBox.shrink()
                            ])))
              ])
            ]));
  }

  Widget _socialLogo(String assetName) {
    return AppViewWidgets.customInkWell(
        onTap: () {},
        child: SvgPicture.asset(assetName,
            colorFilter: ColorFilter.mode(white, BlendMode.srcIn),
            height: _BottomBarConstants._iconSize));
  }

  TextStyle get _style => TextStyle(
      fontFamily: 'Neuropolitical',
      fontSize: _BottomBarConstants._fontSize,
      color: scaffoldBackgroundColor);
}

import 'package:new_weedus/export.dart';

class AppBarTitle extends CustomAppBar {
  AppBarTitle(this.menuOnTap, {Key? key}) : super(key: key);
  final VoidCallback? menuOnTap;

  final EdgeInsetsGeometry _padding = EdgeInsets.only(bottom: 6.0);
  final String _path = 'assets/app/background-leaf2.png';
  final double _itemSize = 45;
  final String _route = '/landing';
  final String _appNameTitle = 'weedus';
  final String _fontFamily = 'Neuropolitical';

  SizedBox get _shrink => SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _appIcon,
      _halfWidthEmptySpace,
      _appName(context),
      addCustomTab! ? _doubleWidthEmptySpace : _shrink,

    ]);
  }

  Padding get _appIcon =>
      Padding(padding: _padding, child: Image.asset(_path, height: _itemSize));

  SizedBox get _halfWidthEmptySpace => SizedBox(width: halfDefaultSize);

  Widget _appName(BuildContext context) {
    return AppViewWidgets.customInkWell(
        onTap: () => context.go(_route),
        child: addBorderText!
            ? TextBorder(child: _appNameWidget)
            : _appNameWidget);
  }

  Text get _appNameWidget => Text(_appNameTitle,
      style: TextStyle(
          fontFamily: _fontFamily,
          fontSize: _itemSize,
          color: white9));

  SizedBox get _doubleWidthEmptySpace => SizedBox(width: doubleDefaultSize);
}

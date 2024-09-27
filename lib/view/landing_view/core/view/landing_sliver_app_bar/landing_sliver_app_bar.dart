import 'package:new_weedus/export.dart';

class LandingSliverAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  LandingSliverAppBar(
      {Key? key,
      this.height = kToolbarHeight,
      required this.scaffoldKey,
      this.forceElevated,
      this.backgroundColor,
      required this.cartState, required this.context})
      : super(key: key);
  final double? height;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final CartState cartState;
  final bool? forceElevated;
  final Color? backgroundColor;
  final double _leadingWidth = 0;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    AuthState authState = Provider.of<AuthState>(context);
    return SliverAppBar(
        pinned: true,
        backgroundColor: backgroundColor ?? nero,
        forceElevated: forceElevated!,
        leading: SizedBox.shrink(),
        leadingWidth: _leadingWidth,
        actions: SliverAppBarWidgets.actionWidgets(
            context, cartState, authState, scaffoldKey,
            cartOnTap: () => _cartDialog(context)),
        title: SliverAppBarWidgets.appBarTitleRow(context, scaffoldKey));
  }

  Future<void> _cartDialog(BuildContext context) async {
    return await ProductCartDialog.showDialog(context,
        maskColor: Colors.transparent,
        clickMaskDismiss: true,
        alignment: Alignment.topRight);
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}

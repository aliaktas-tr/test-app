import 'package:new_weedus/export.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> with ShopViewMixin {
  @override
  Widget build(BuildContext context) {
    var cartState = context.watch<CartState>();
    var authState = context.watch<AuthState>();
    var productFilterViewModel = context.watch<ShopViewProductFilterViewModel>();
    final RouteMatch lastMatch = GoRouter.of(context).routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : GoRouter.of(context).routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    print('location: $location');
    return Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        floatingActionButton: ShopViewBuildWidgets.adminPanelButton(context),
        appBar: ShopViewBuildWidgets.getAppBar(context,cartState,scaffoldKey),
        drawer: ShopViewBuildWidgets.menuDrawer(context,cartState,authState,this),
        body: ShopViewBuildWidgets.body(context, productFilterViewModel: productFilterViewModel));
  }
}

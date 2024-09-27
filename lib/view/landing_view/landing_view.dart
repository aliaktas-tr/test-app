import 'package:new_weedus/export.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> with LandingViewMixin {
  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartState>(context);
    AuthState authState = Provider.of<AuthState>(context, listen: false);
    LandingProductState state = Provider.of<LandingProductState>(context);
    final RouteMatch lastMatch =
        GoRouter.of(context).routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : GoRouter.of(context).routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    print('location: $location');
    return Scaffold(
        key: landingPageScaffoldKey,
        extendBodyBehindAppBar: true,
        floatingActionButton:
            context.width <= 1100 ? null : _adminPanelButton(context),
        drawer: DrawerMenuView(
            context: context,
            isCartWidgetAvailable: false,
            cart: _cart,
            authState: authState),
        body: _buildNestedScrollView(_cart, state));
  }

  NestedScrollView _buildNestedScrollView(
          CartState cart, LandingProductState state) =>
      NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              PromoDateBanner(promoDates: promoDates!),
              SliverStickyHeader(sticky: true, header: LandingMainBannerView()),
              LandingSliverAppBar(
                context: context,
                  scaffoldKey: landingPageScaffoldKey,
                  cartState: cart,
                  forceElevated: innerBoxIsScrolled)
            ];
          },
          body: buildSafeArea(state));

  Widget _adminPanelButton(BuildContext context) => Container(
      margin: const EdgeInsets.all(halfDefaultSize),
      width: 165.0,
      child: DrawerWidgets.testButton(context));

  Widget buildSafeArea(LandingProductState state) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kToolbarHeight),
                MonogramView(),
                _heightEmptySpace,
                LandingProductView(
                    productList: flowersProducts,
                    title: 'Flowers',
                    controller: flowerController,
                    scrollDirection: flowerScrollDirection,
                    nextOnTap: () =>
                        state.nextFlowerIndex(controller: flowerController),
                    previousOnTap: () => state.previousFlowerIndex(
                        controller: flowerController)),
                _heightEmptySpace,
                StiiizyView(),
                _heightEmptySpace,
                LandingProductView(
                    productList: preRollProducts,
                    title: 'Pre-Roll',
                    controller: prerollController,
                    scrollDirection: prerollScrollDirection,
                    nextOnTap: () =>
                        state.nextPrerollIndex(controller: prerollController),
                    previousOnTap: () => state.previousPrerollIndex(
                        controller: prerollController)),
                _heightEmptySpace,
                CbxView(),
                _heightEmptySpace,
                LandingProductView(
                    productList: concentratesProducts,
                    title: 'Concentrates',
                    controller: concentratesController,
                    scrollDirection: concentratesScrollDirection,
                    nextOnTap: () => state.nextConcentratesIndex(
                        controller: concentratesController),
                    previousOnTap: () => state.previousConcentratesIndex(
                        controller: concentratesController)),
                _heightEmptySpace,
                BottomBarView()
              ],
            ),
          ),
        ],
      );

  SizedBox get _heightEmptySpace => SizedBox(height: 50);
}

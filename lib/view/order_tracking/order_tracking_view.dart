import 'package:new_weedus/export.dart';

class OrderTrackingView extends StatelessWidget {
  OrderTrackingView({super.key, this.id});

  final String? id;
  final String _route = '/product';

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    CartState cart = context.watch<CartState>();
    return Scaffold(
        appBar: CustomAppBar(
            scaffoldKey: scaffoldKey,
            isTrackingPage: true,
            onAppNameRouteTap: ()=> context.go(_route),
            cartState: cart),
        body: !Responsive.isMobile(context)
            ? OrderTrackingBuildWidgets.buildDesktopView(context)
            : OrderTrackingBuildWidgets.buildMobileView(context));
  }
}

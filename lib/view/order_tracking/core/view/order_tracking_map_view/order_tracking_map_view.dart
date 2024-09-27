import 'package:new_weedus/export.dart';

class OrderTrackingMapView extends StatefulWidget {
  const OrderTrackingMapView({super.key});

  @override
  State<OrderTrackingMapView> createState() => _OrderTrackingMapViewState();
}

class _OrderTrackingMapViewState extends State<OrderTrackingMapView> {
  @override
  void initState() {
    super.initState();
    OrderTrackingMapViewModel viewModel =
        Provider.of<OrderTrackingMapViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    OrderTrackingMapViewModel viewModel =
        context.watch<OrderTrackingMapViewModel>();
    return Stack(children: [
      OrderTrackingMapBuildWidgets.map(viewModel),
      OrderTrackingMapBuildWidgets.distanceWidget(context, viewModel)
    ]);
  }
}

import 'package:new_weedus/export.dart';

class TrackingMapView extends StatefulWidget {
  const TrackingMapView({super.key});

  @override
  State<TrackingMapView> createState() => _TrackingMapViewState();
}

class _TrackingMapViewState
    extends State<TrackingMapView> /* with TrackingMapViewMixin*/ {
  @override
  void initState() {
    OrderTrackingMapViewModel viewModel =
        Provider.of<OrderTrackingMapViewModel>(context, listen: false);
    super.initState();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    OrderTrackingMapViewModel viewModel =
        Provider.of<OrderTrackingMapViewModel>(context, listen: false);
    return Stack(
      children: [
        OrderTrackingMapBuildWidgets.map(viewModel),
        OrderTrackingMapBuildWidgets.distanceWidget(context, viewModel)
      ],
    );
  }
/*
  GoogleMap _map(OrderTrackingMapViewModel viewModel) => GoogleMap(
      zoomGesturesEnabled: true,
      minMaxZoomPreference: viewModel.minMaxZoomPreference,
      initialCameraPosition: viewModel.getCameraPosition(),
      markers: {
        viewModel.getStartLocationMarker(),
        viewModel.getDeliveryLocationMarker()
      },
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) =>
          viewModel.mapsInit(controller));

  Positioned _distanceWidget(OrderTrackingMapViewModel viewModel) => Positioned(
      bottom: _getPosition(viewModel),
      left: _getPosition(viewModel),
      child: _distanceCard(viewModel));

  Card _distanceCard(OrderTrackingMapViewModel viewModel) => Card(
      elevation: viewModel.elevation,
      margin: EdgeInsets.zero,
      child: _distanceText(viewModel));

  Container _distanceText(OrderTrackingMapViewModel viewModel) => Container(
      color: nero,
      padding: EdgeInsets.symmetric(
          vertical: halfDefaultSize, horizontal: defaultSize),
      child: AppViewWidgets.textMontserrat(viewModel.distance,
          fontSize: viewModel.fontSize,
          fontWeight: FontWeight.w500,
          color: white));

  double _getPosition(OrderTrackingMapViewModel viewModel) {
    if (Responsive.isMobile(context)) {
      return viewModel.positionLowValue;
    } else {
      return viewModel.positionHighValue;
    }
  }*/
}

import 'package:new_weedus/export.dart';

class OrderTrackingMapBuildWidgets {


  static GoogleMap map(OrderTrackingMapViewModel viewModel) => GoogleMap(
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

  static Positioned distanceWidget(
          BuildContext context, OrderTrackingMapViewModel viewModel) =>
      Positioned(
          bottom: _getPosition(context,viewModel),
          left: _getPosition(context,viewModel),
          child: _distanceCard(viewModel));

  static Card _distanceCard(OrderTrackingMapViewModel viewModel) => Card(
      elevation: viewModel.elevation,
      margin: EdgeInsets.zero,
      child: _distanceText(viewModel));

  static Container _distanceText(OrderTrackingMapViewModel viewModel) =>
      Container(
          color: nero,
          padding: EdgeInsets.symmetric(
              vertical: halfDefaultSize, horizontal: defaultSize),
          child: AppViewWidgets.textMontserrat(viewModel.distance,
              fontSize: viewModel.fontSize, fontWeight: FontWeight.w500, color: white));

  static double _getPosition(BuildContext context,OrderTrackingMapViewModel viewModel) {
    if (Responsive.isMobile(context)) {
      return viewModel.positionLowValue;
    } else {
      return viewModel.positionHighValue;
    }
  }
}

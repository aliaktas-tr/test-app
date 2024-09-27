import 'package:new_weedus/export.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mapsTool;

class OrderTrackingMapViewModel extends ChangeNotifier {
  String _mapSendIconPath = 'assets/map/send_map.png';
  String _mapDeliveryIconPath = 'assets/map/delivery_map.png';
  String _weedusTitle = 'Weedus';
  String _deliveryTitle = 'Delivery';
  final String _totalDistanceTitle = 'Total Distance:  ';
  final String _milesTitle = '  miles';
  final double _distanceValue = 1000.0;
  BitmapDescriptor _markerSendingIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor _markerDeliveryIcon = BitmapDescriptor.defaultMarker;
  GoogleMapController? _mapController;
  LatLng _startLocation = LatLng(34.09522082822633, -118.3640519049759);
  LatLng _endLocation = LatLng(34.049904443287744, -118.27299146265116);
  var _startPoint = mapsTool.LatLng(34.09522082822633, -118.3640519049759);
  var _endPoint = mapsTool.LatLng(34.049904443287744, -118.27299146265116);
  double _miles = 0.6214;
  double? _distance;
  double _zoomValue = 12.0;
  final double _positionLowValue = 30.0;
  final double _positionHighValue = 50.0;
  final double _elevation = 4.0;
  final double _fontSize = 14.0;
  MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference(10, 15);

  void init() {
    addCustomIcon();
    _distance =
        mapsTool.SphericalUtil.computeDistanceBetween(_startPoint, _endPoint) /
            _distanceValue *
            _miles;
  }

  void addCustomIcon() {
    BitmapDescriptor.asset(const ImageConfiguration(), _mapSendIconPath)
        .then((icon) {
      _markerSendingIcon = icon;
      notifyListeners();
    });
    BitmapDescriptor.asset(const ImageConfiguration(), _mapDeliveryIconPath)
        .then((icon) {
      _markerDeliveryIcon = icon;
      notifyListeners();
    });
  }

  CameraPosition getCameraPosition() {
    return CameraPosition(target: _startLocation, zoom: _zoomValue);
  }

  Marker getStartLocationMarker() {
    return Marker(
        markerId: MarkerId(_startLocation.toString()),
        position: _startLocation,
        infoWindow: InfoWindow(title: _weedusTitle),
        icon: _markerSendingIcon);
  }

  Marker getDeliveryLocationMarker() {
    return Marker(
        markerId: MarkerId(_endLocation.toString()),
        position: _endLocation,
        infoWindow: InfoWindow(title: _deliveryTitle),
        icon: _markerDeliveryIcon);
  }

  void mapsInit(GoogleMapController controller) {
    _mapController = controller;
    _mapController!
        .animateCamera(CameraUpdate.newLatLngZoom(_endLocation, _zoomValue));
    notifyListeners();
  }

  MinMaxZoomPreference get minMaxZoomPreference => _minMaxZoomPreference;

  String get distance =>
      _totalDistanceTitle + _distance!.toStringAsFixed(2) + _milesTitle;

  double get positionLowValue => _positionLowValue;

  double get positionHighValue => _positionHighValue;

  double get elevation => _elevation;

  double get fontSize => _fontSize;

}

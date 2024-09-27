
import 'dart:ui';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:new_weedus/export.dart';

class GoogleMapImageMarker extends StatefulWidget {
  const GoogleMapImageMarker({super.key, this.id});

  @override
  _GoogleMapImageMarkerState createState() => _GoogleMapImageMarkerState();
  final String? id;
}

class _GoogleMapImageMarkerState extends State<GoogleMapImageMarker> {
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    // Replace 'locations' with your list of locations containing image URLs
    List<Location> locations = [
      Location(
          id: '1',
          name: 'Location 1',
          imageUrl: 'https://gravatar.com/avatar/27205e5c51cb03f862138b22bcb5dc20f94a342e744ff6df1b8dc8af3c865109.jpg',
          latitude: 37.7749,
          longitude: -122.4194),
      Location(
          id: '2',
          name: 'Location 2',
          imageUrl: 'https://gravatar.com/avatar/27205e5c51cb03f862138b22bcb5dc20f94a342e744ff6df1b8dc8af3c865109.jpg',
          latitude: 37.6841,
          longitude: -122.4109),
      // Add more locations as needed
    ];

    List<Marker?> customMarkers = await Future.wait(
      locations.map(
            (location) async => await CustomMarker.buildMarkerFromUrl(
          id: location.id,
          url: location.imageUrl,
          position: LatLng(location.latitude, location.longitude),
          width: 100,
          onTap: () {
            // Handle marker tap event here
          },
        ),
      ),
    );

    setState(() {
      _markers.addAll(customMarkers.whereType<Marker>());
    });

    /*setState(() {
      _markers.addAll(customMarkers.where((marker) => marker != null));
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(37.7749, -122.4194),
        zoom: 12,
      ),
      markers: _markers,
    );
  }
}

class Location {
  final String id;
  final String name;
  final String imageUrl;
  final double latitude;
  final double longitude;

  Location({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
  });
}

class CustomMarker {
  static Future<Marker?> buildMarkerFromUrl({
    required String id,
    required String url,
    required LatLng position,
    int? width,
    int? height,
    Offset offset = const Offset(0.5, 0.5),
    VoidCallback? onTap,
  }) async {
    var icon = await getIconFromUrl(url, height: height, width: width);

    if (icon == null) {
      return null;
    }

    return Marker(
        markerId: MarkerId(id),
        position: position,
        icon: icon,
        anchor: offset,
        onTap: onTap);
  }

  static Future<BitmapDescriptor?> getIconFromUrl(
      String url, {
        int? width,
        int? height,
      }) async {
    Uint8List? bytes = await getBytesFromUrl(url, height: height, width: width);

    if (bytes == null) return null;

    return BitmapDescriptor.bytes(bytes);
  }

  static Future<Uint8List?> getBytesFromUrl(
      String url, {
        int? width,
        int? height,
      }) async {
    // Modify this as needed, but you need caching unless you're displaying just a few markers.
    var cache = CacheManager(Config(
      "markers",
      stalePeriod: const Duration(days: 7),
    ));

    File file = await cache.getSingleFile(url);

    Uint8List bytes = await file.readAsBytes();

    return resizeImageFromBytes(bytes, width: width, height: height);
  }

  static Future<Uint8List?> resizeImageFromBytes(
      Uint8List bytes, {
        int? width,
        int? height,
      }) async {
    Codec codec = await instantiateImageCodec(bytes,
        targetWidth: width, targetHeight: height);
    FrameInfo fi = await codec.getNextFrame();
    ByteData? data = await fi.image.toByteData(format: ImageByteFormat.png);

    return data?.buffer.asUint8List();
  }
}
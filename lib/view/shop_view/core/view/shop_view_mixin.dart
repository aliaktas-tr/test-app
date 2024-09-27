
import 'package:new_weedus/export.dart';

mixin ShopViewMixin on State<ShopView> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<TextAndDateTimeModel> _orderList = [];
  String _formattedDate = '';
  String _orderStatus = '';
  final double _responsiveSize = 1080;
  final double _drawerWidth = 400;
  final int _flexValue = 5;

  DateTime _now = DateTime.now();
  bool? _isLoaded;

  @override
  void initState() {
    _formattedDate = DateFormat('MMM d, HH:mm').format(_now);
    _orderStatus = 'Your order has been placed\n$_formattedDate';
    _orderList = [
      TextAndDateTimeModel('Your order has been placed', '$_formattedDate'),
      TextAndDateTimeModel('', '')
    ];
    super.initState();
    _isLoaded = false;
    if (this.mounted)
      Future.delayed(Duration(milliseconds: 1000)).whenComplete(() {
        if (this.mounted) {
          setState(() {
            _isLoaded = true;
          });
        }
      });
  }

  void categoryOnTap(int index, {ShopState? state}) {
    setState(() {
      state!.setPageIndex = index;
      _isLoaded = false;
    });
    Future.delayed(Duration(milliseconds: 500))
        .whenComplete(() => setState(() => _isLoaded = true));
  }

  void strainTypeOnTap(int index, {ShopState? state}) {
    setState(() {
      state!.setStrainIndex = index;
      _isLoaded = false;
    });
    Future.delayed(Duration(milliseconds: 500))
        .whenComplete(() => setState(() => _isLoaded = true));
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  List<TextAndDateTimeModel> get listedOrder => _orderList;

  String get orderStatus => _orderStatus;

  double get responsiveSize => _responsiveSize;

  double get drawerWidth => _drawerWidth;

  bool get isLoaded => _isLoaded!;

  int get flexValue => _flexValue;
}

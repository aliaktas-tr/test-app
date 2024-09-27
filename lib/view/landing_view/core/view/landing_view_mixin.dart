import 'package:new_weedus/export.dart';

mixin LandingViewMixin on State<LandingView> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DateTime? _startDate;
  DateTime? _endDate;
  String? _dates = '';
  String? startMonth = '';
  String? endMonth = '';
  String? startDate = '';
  String? endDate = '';
  late AutoScrollController _flowerController;
  late AutoScrollController _prerollController;
  late AutoScrollController _concentratesController;
  final _flowerScrollDirection = Axis.horizontal;
  final _prerollScrollDirection = Axis.horizontal;
  final _concentratesScrollDirection = Axis.horizontal;

  @override
  void initState() {
    super.initState();

    _startDate = DateTime.now();
    _startDate = _startDate!.add(Duration(days: 5));
    _endDate = _startDate!.add(Duration(days: 9));
    startMonth = DateFormat.MMMM().format(_startDate!);
    endMonth = DateFormat.MMMM().format(_endDate!);
    startDate = DateFormat.d().format(_startDate!);
    endDate = DateFormat.d().format(_endDate!);
    if (_startDate!.month == _endDate!.month) {
      _dates = '$startMonth $startDate - $endDate';
    } else {
      _dates = '$startMonth $startDate - $endMonth $endDate';
    }

    _flowerController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: _flowerScrollDirection);

    _prerollController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: _prerollScrollDirection);

    _concentratesController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: _concentratesScrollDirection);
  }


  String? get promoDates => _dates;

  GlobalKey<ScaffoldState> get landingPageScaffoldKey => _scaffoldKey;

  AutoScrollController get flowerController => _flowerController;

  AutoScrollController get prerollController => _prerollController;

  AutoScrollController get concentratesController => _concentratesController;

  Axis get flowerScrollDirection => _flowerScrollDirection;

  Axis get prerollScrollDirection => _prerollScrollDirection;

  Axis get concentratesScrollDirection => _concentratesScrollDirection;
}

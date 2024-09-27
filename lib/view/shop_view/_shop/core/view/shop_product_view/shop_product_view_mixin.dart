import 'package:new_weedus/export.dart';

mixin ShopProductViewMixin on State<ShopProductView> {
  bool _isListView = false;
  String _viewTypeValue = 'Card View';
  List<String> _viewTypeList = ['List View', 'Card View'];

  final double _titleFontSize = 18;
  final double _dropTitleFontSize = 16;
  final double _minSpacing = defaultSize * 1.5;
  final double _desiredItemWidth = 290;

  void onChanged(
      String newValue, ShopViewProductFilterViewModel productFilterViewModel) {
    if (newValue.contains('List')) {
      setState(() {
        _viewTypeValue = newValue;
        _isListView = true;
        productFilterViewModel.applyFilters();
      });
    } else {
      setState(() {
        _viewTypeValue = newValue;
        _isListView = false;
        productFilterViewModel.applyFilters();
      });
    }

    /*  setState(() {
      _viewTypeValue = newValue;
      productFilterViewModel.applyFilters();
      if(_viewTypeValue.contains('List')){
        _isListView = true;
      }
      else{
        _isListView = false;
      }
      //_isListView = !isListView;
    });*/
  }

  List<double> getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (_viewTypeList.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      } else if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  bool get isListView => _isListView;

  String get viewTypeValue => _viewTypeValue;

  List<String> get viewTypeList => _viewTypeList;

  double get titleFontSize => _titleFontSize;

  double get dropTitleFontSize => _dropTitleFontSize;

  double get minSpacing => _minSpacing;

  double get desiredItemWidth => _desiredItemWidth;
}

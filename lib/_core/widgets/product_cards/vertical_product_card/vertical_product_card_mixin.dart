import 'package:new_weedus/export.dart';

mixin VerticalProductCardMixin on State<VerticalProductCardView> {
  final ProductCartViewModel _cardViewModel = ProductCartViewModel();
  double _purchaseSize = 28.5;
  bool? _purchaseErrorExpand = false;
  Timer? _purchaseErrorTimer;
  final String _indicaTitle = 'Indica';
  final String _sativaTitle = 'Sativa';
  final String _hybridTitle = 'Hybrid';
  final String _cbdTitle = 'CBD';
  final String _thcTitle = 'THC';
  final String _flOzTitle = 'fl oz';
  final String _mlTitle = 'ml';
  final String _slash = ' / ';
  final double _containerWidth = 290;
  final BoxConstraints _constraints =
      BoxConstraints(minWidth: 280, maxWidth: 290);
  final double _imageWidth = 150;
  final double _imageHeight = 100;
  final double _errorFontSize = 16;
  final double _errorFontHeight = 1.4;
  final double _errorContainerHeight = 90;
  final double _typeFontSize = 15;
  final double _iconSize = 20;
  BoxDecoration _decoration = BoxDecoration(
      color: Colors.white,
     // borderRadius: BorderRadius.circular(quarterDefaultSize),
      boxShadow: [
        BoxShadow(
            color: Color(0xfff1f1f1),
            blurRadius: 6.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 0.0))
      ]);

  BoxDecoration _errorBoxDecoration = BoxDecoration(
      color: Colors.red,
    /*  borderRadius: BorderRadius.only(
          topLeft: Radius.circular(quarterDefaultSize),
          topRight: Radius.circular(quarterDefaultSize))*/);

  void errorCloseTap() {
    setState(() {
      _purchaseErrorExpand = false;
      _purchaseErrorTimer!.cancel();
    });
  }

  void addProduct(BuildContext context,CartState cart) {
    if (widget.product!.size != null &&
        widget.product!.size! + cart.totalSize > _purchaseSize) {
      setState(() {
        _purchaseErrorExpand = true;
      });
      if (_purchaseErrorExpand!) {
        _purchaseErrorTimer = Timer(Duration(seconds: 5), () {
          if (mounted) {
            setState(() {
              _purchaseErrorExpand = false;
            });
          }
        });
      }
    } else if (widget.product!.sizeList != null &&
        widget.product!.sizeList!.length > 1) {
      showDialog(
          context: context,
          builder: (context) => ProductSizeSelectorDialogView(
            contextDue: context,
              product: widget.product,
              isDispensaryView: widget.isDispensaryView));
    } else {
      if (cart.cartItems!.containsKey(widget.product!.tag)) {
        _cardViewModel.addItemToCart(context,
            product: widget.product,
            cart: cart,
            isDispensaryView: widget.isDispensaryView);
      } else {
        _cardViewModel.addNewItemToCart(context,
            product: widget.product,
            cart: cart,
            isDispensaryView: widget.isDispensaryView);
      }
    }
  }

  ProductCartViewModel get cardViewModel => _cardViewModel;

  double get purchaseSize => _purchaseSize;

  bool? get purchaseErrorExpand => _purchaseErrorExpand;

  Timer? get purchaseErrorTimer => _purchaseErrorTimer;

  BoxConstraints get constraints => _constraints;

  double get imageWidth => _imageWidth;

  double get imageHeight => _imageHeight;

  BoxDecoration get decoration => _decoration;

  BoxDecoration get errorBoxDecoration => _errorBoxDecoration;

  double get containerWidth => _containerWidth;

  double get errorFontSize => _errorFontSize;

  double get errorFontHeight => _errorFontHeight;

  double get errorContainerHeight => _errorContainerHeight;

  String get indicaTitle => _indicaTitle;

  String get sativaTitle => _sativaTitle;

  String get hybridTitle => _hybridTitle;

  String get cbdTitle => _cbdTitle;

  String get thcTitle => _thcTitle;

  double get typeFontSize => _typeFontSize;

  String get flOzTitle => _flOzTitle;

  String get mlTitle => _mlTitle;

  String get slash => _slash;

  double get iconSize => _iconSize;
}

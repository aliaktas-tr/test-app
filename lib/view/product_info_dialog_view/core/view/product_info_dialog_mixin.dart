import 'package:new_weedus/export.dart';

mixin ProductInfoDialogMixin on State<ProductInfoDialogView> {
  int _currentImageIndex = 0;
  final double _sizeValue = 0.6;
  int _priceListCurrentIndex = 0;
  bool _purchaseErrorExpand = false;
  final double _purchaseSize = 28.5;
  Timer? purchaseErrorTimer;

  void listPriceOnTap(int index) {
    setState(() {
      _priceListCurrentIndex = index;
    });
  }

  void priceListOnTap(
      int index, CartState cart, CloseButtonCountDownState _priceValueProvider) {
    if (widget.product.sizeList != null &&
        widget.product.sizeList![index] + cart.totalSize > _purchaseSize) {
      setState(() {
        _purchaseErrorExpand = true;
      });
      if (_purchaseErrorExpand) {
        purchaseErrorTimer = Timer(Duration(seconds: 5), () {
          if (mounted) {
            setState(() {
              _purchaseErrorExpand = false;
            });
          }
        });
      }
    } else {
      if (cart.cartItems!.containsKey(widget.product.tagList![index])) {
        cart.addFlowerItem(product: widget.product, index: index);
      } else {
        cart.addNewFlowerToCart(product: widget.product, index: index);
      }
      _priceValueProvider.startTimer();
    }
  }

  void priceOnTap(CartState cart, CloseButtonCountDownState _priceValueProvider) {
    if (widget.product.size != null &&
        widget.product.size! + cart.totalSize > _purchaseSize) {
      setState(() {
        _purchaseErrorExpand = true;
      });
      if (_purchaseErrorExpand) {
        purchaseErrorTimer = Timer(Duration(seconds: 5), () {
          if (mounted) {
            setState(() {
              _purchaseErrorExpand = false;
            });
          }
        });
      }
    } else {
      if (cart.cartItems!.containsKey(widget.product.tag)) {
        cart.addItem(product: widget.product);
      } else {
        cart.addToCart(product: widget.product);
      }
      _priceValueProvider.startTimer();
    }
  }

  void selectImage(int index) {
    setState(() {
      _currentImageIndex = index;
    });
  }

  double get sizeValue => _sizeValue;
  int get currentImageIndex => _currentImageIndex;
}

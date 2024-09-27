import 'dart:convert';

import 'package:new_weedus/export.dart';

mixin ProductCartMixin on State<ProductCartView> {
/*  @override
  void initState() {
    super.initState();
    _loadCartData();
  }

  Future<Map<String, Product>?> getCartData() async {
    final prefs = await SharedPreferences.getInstance();
    final cartDataString = prefs.getString('cartData');
    if (cartDataString != null) {
      final cartDataMap = jsonDecode(cartDataString) as Map<String, dynamic>;
      return cartDataMap
          .map((key, value) => MapEntry(key, Product.fromJson(value)));
    }
    return null;
  }

  void _loadCartData() async {
    //CartState _cart = Provider.of<CartState>(context, listen: false);
    final cartData = await getCartData();
    if (cartData != null) {
      setState(() {
        _cart.cartItems = cartData;
      });
    }
  }*/
}

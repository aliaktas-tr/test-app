import 'dart:convert';

import 'package:new_weedus/export.dart';

class CartState with ChangeNotifier {


  Map<String, Product> _cartItems = {};
  final String _flower = 'flower';
  final String _preRoll = 'preRoll';
  final String _concentrate = 'concentrate';

  Map<String, Product> get cartItems {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  /// Duplicate functions
  Map<String, Product> _cartItems2 = {};

  Map<String, Product> get cartItems2 {
    return {..._cartItems2};
  }

  int get itemCount2 {
    return _cartItems2.length;
  }

  bool hasPayment = false;

  void updatePayment(bool payment) {
    hasPayment = payment;
    notifyListeners();
  }

  void reduceItemF({Product? product}) {
    if (product!.quantity == 1) {
      _cartItems.remove(product.tag);
      notifyListeners();
    } else {
      _cartItems.update(
        product.tag!,
        (cartItem) => Product(
            images: product.images!,
            title: product.title,
            price: product.price,
            brand: product.brand,
            quantity: cartItem.quantity! - 1,
            tag: product.tag,
            description: product.description,
            tac: product.tac,
            thc: product.thc,
            totalThc: product.totalThc,
            totalCbd: product.totalCbd,
            cbd: product.cbd,
            type: product.type,
            apparelSize: product.apparelSize,
            pack: product.pack,
            rating: product.rating,
            size: product.size,
            discount: product.discount,
            flOz: product.flOz,
            ml: product.ml,
            calories: product.calories,
            comment: product.comment,
            isSativa: product.isSativa,
            isIndica: product.isIndica,
            isHybrid: product.isHybrid,
            isCBD: product.isCBD,
            product: product.product),
      );
      notifyListeners();
    }
  }

  void addFlowerItem({Product? product, int? index}) {
    _cartItems.update(product!.tagList![index!], (existingCartItem) {
      return Product(
          images: existingCartItem.images,
          title: existingCartItem.title,
          price: product.priceList![index],
          quantity: existingCartItem.quantity! + 1,
          tag: product.tagList![index],
          brand: existingCartItem.brand,
          description: existingCartItem.description,
          tac: existingCartItem.tac,
          thc: existingCartItem.thc,
          totalThc: existingCartItem.totalThc,
          totalCbd: existingCartItem.totalCbd,
          cbd: existingCartItem.cbd,
          type: existingCartItem.type,
          apparelSize: existingCartItem.apparelSize,
          pack: existingCartItem.pack,
          rating: existingCartItem.rating,
          size: product.sizeList![index],
          discount: existingCartItem.discount,
          flOz: existingCartItem.flOz,
          ml: existingCartItem.ml,
          calories: existingCartItem.calories,
          comment: existingCartItem.comment,
          isSativa: existingCartItem.isSativa,
          isIndica: existingCartItem.isIndica,
          isHybrid: existingCartItem.isHybrid,
          isCBD: existingCartItem.isCBD,
          product: existingCartItem.product);
    });

    notifyListeners();
  }

  void copyCart() {
    _cartItems2.addAll(_cartItems);
  }

  void addNewFlowerToCart({Product? product, int? index}) {
    _cartItems.putIfAbsent(
        product!.tagList![index!],
        () => Product(
            images: product.images!,
            title: product.title,
            price: product.priceList![index],
            brand: product.brand,
            description: product.description,
            tac: product.tac,
            thc: product.thc,
            totalThc: product.totalThc,
            totalCbd: product.totalCbd,
            cbd: product.cbd,
            type: product.type,
            apparelSize: product.apparelSize,
            pack: product.pack,
            rating: product.rating,
            size: product.sizeList![index],
            discount: product.discount,
            flOz: product.flOz,
            ml: product.ml,
            calories: product.calories,
            comment: product.comment,
            isSativa: product.isSativa,
            isIndica: product.isIndica,
            isHybrid: product.isHybrid,
            isCBD: product.isCBD,
            product: product.product,
            quantity: 1,
            tag: product.tagList![index]));

    notifyListeners();
  }

  void reduceItem({Product? product}) {
    if (product!.quantity == 1) {
      _cartItems.remove(product.tag);
      notifyListeners();
    } else {
      _cartItems.update(
        product.tag!,
        (cartItem) => Product(
            images: product.images!,
            title: product.title,
            price: product.price,
            priceList: product.priceList,
            sizeList: product.sizeList,
            brand: product.brand,
            quantity: cartItem.quantity! - 1,
            tag: product.tag,
            description: product.description,
            tac: product.tac,
            thc: product.thc,
            totalThc: product.totalThc,
            totalCbd: product.totalCbd,
            cbd: product.cbd,
            type: product.type,
            apparelSize: product.apparelSize,
            pack: product.pack,
            rating: product.rating,
            size: product.size,
            discount: product.discount,
            flOz: product.flOz,
            ml: product.ml,
            calories: product.calories,
            comment: product.comment,
            isSativa: product.isSativa,
            isIndica: product.isIndica,
            isHybrid: product.isHybrid,
            isCBD: product.isCBD,
            product: product.product),
      );
      notifyListeners();
    }
  }

  void addItem({Product? product}) {
    _cartItems.update(product!.tag!, (existingCartItem) {
      return Product(
          images: existingCartItem.images,
          title: existingCartItem.title,
          price: product.price,
          quantity: existingCartItem.quantity! + 1,
          tag: existingCartItem.tag,
          brand: existingCartItem.brand,
          description: existingCartItem.description,
          tac: existingCartItem.tac,
          thc: existingCartItem.thc,
          totalThc: existingCartItem.totalThc,
          totalCbd: existingCartItem.totalCbd,
          cbd: existingCartItem.cbd,
          type: existingCartItem.type,
          apparelSize: existingCartItem.apparelSize,
          pack: existingCartItem.pack,
          // flowerType: existingCartItem.flowerType,
          rating: existingCartItem.rating,
          size: existingCartItem.size,
          discount: existingCartItem.discount,
          flOz: existingCartItem.flOz,
          ml: existingCartItem.ml,
          calories: existingCartItem.calories,
          comment: existingCartItem.comment,
          isSativa: existingCartItem.isSativa,
          isIndica: existingCartItem.isIndica,
          isHybrid: existingCartItem.isHybrid,
          isCBD: existingCartItem.isCBD,
          product: existingCartItem.product);
    });
    notifyListeners();
  }

  void addToCart({Product? product}) {
    _cartItems.putIfAbsent(
        product!.tag!,
        () => Product(
            images: product.images!,
            title: product.title,
            price: product.price,
            priceList: product.priceList,
            sizeList: product.sizeList,
            brand: product.brand,
            description: product.description,
            tac: product.tac,
            thc: product.thc,
            totalThc: product.totalThc,
            totalCbd: product.totalCbd,
            cbd: product.cbd,
            type: product.type,
            apparelSize: product.apparelSize,
            pack: product.pack,
            rating: product.rating,
            size: product.size,
            discount: product.discount,
            flOz: product.flOz,
            ml: product.ml,
            calories: product.calories,
            comment: product.comment,
            isSativa: product.isSativa,
            isIndica: product.isIndica,
            isHybrid: product.isHybrid,
            isCBD: product.isCBD,
            product: product.product,
            quantity: 1,
            tag: product.tag));
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });
    return total;
  }

  ///
  double get totalAmount2 {
    var total = 0.0;
    _cartItems2.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });
    return total;
  }

  double get discount {
    var totalDiscount = 0.0;
    _cartItems.forEach((key, cartItem) {
      if (cartItem.discount != null) {
        totalDiscount += cartItem.price! * cartItem.discount! / 100;
      }
    });
    return totalDiscount;
  }

  ///
  double get discount2 {
    var totalDiscount = 0.0;
    _cartItems2.forEach((key, cartItem) {
      if (cartItem.discount != null) {
        totalDiscount += cartItem.price! * cartItem.discount! / 100;
      }
    });
    return totalDiscount;
  }

  double get totalSize {
    var total = 0.0;

    _cartItems.forEach((key, cartItem) {
      if (cartItem.product == _flower ||
          cartItem.product == _preRoll ||
          cartItem.product == _concentrate) {
        total += cartItem.size! * cartItem.quantity!;
      }
    });
    return total;
  }

  ///
  double get totalSize2 {
    var total = 0.0;

    _cartItems2.forEach((key, cartItem) {
      if (cartItem.product == _flower ||
          cartItem.product == _preRoll ||
          cartItem.product == _concentrate) {
        total += cartItem.size! * cartItem.quantity!;
      }
    });
    return total;
  }

  void clearItems() {
    _cartItems.clear();
    notifyListeners();
  }

  double get subTotal {
    var cardSubtotal = totalAmount - discount;
    return cardSubtotal;
  }

  ///
  double get subTotal2 {
    var cardSubtotal = totalAmount2 - discount2;
    return cardSubtotal;
  }

  double get totalCannabisTax {
    var cannabisTaxTotal = 0.0;
    var _subTotal = 0.0;
    double _cannabisTax = 15.0;

    if (totalAmount != 0.0) {
      _subTotal = totalAmount - discount;
      var _taxCannabis = _subTotal * _cannabisTax / 100;
      cannabisTaxTotal = _taxCannabis;
    }

    return cannabisTaxTotal;
  }

  ///
  double get totalCannabisTax2 {
    var cannabisTaxTotal = 0.0;
    var _subTotal = 0.0;
    double _cannabisTax = 15.0;

    if (totalAmount2 != 0.0) {
      _subTotal = totalAmount2 - discount2;
      var _taxCannabis = _subTotal * _cannabisTax / 100;
      cannabisTaxTotal = _taxCannabis;
    }

    return cannabisTaxTotal;
  }

  double get totalSalesTax {
    var saleTaxTotal = 0.0;
    var _subTotal = 0.0;
    double _salesTax = 7.25;

    if (totalAmount != 0.0) {
      _subTotal = totalAmount - discount;
      var _saleTax = _subTotal * _salesTax / 100;
      saleTaxTotal = _saleTax;
    }

    return saleTaxTotal;
  }

  ///
  double get totalSalesTax2 {
    var saleTaxTotal = 0.0;
    var _subTotal = 0.0;
    double _salesTax = 7.25;

    if (totalAmount2 != 0.0) {
      _subTotal = totalAmount2 - discount2;
      var _saleTax = _subTotal * _salesTax / 100;
      saleTaxTotal = _saleTax;
    }

    return saleTaxTotal;
  }

  double get taxesAmount {
    var taxAmount = totalCannabisTax + totalSalesTax;
    return taxAmount;
  }

  double get taxesAmount2 {
    var taxAmount = totalCannabisTax2 + totalSalesTax2;
    return taxAmount;
  }

  double get getTotalAmountAfterTaxes {
    var totalAmountAfterTaxes = subTotal + taxesAmount;
    return totalAmountAfterTaxes;
  }

  ///
  double get getTotalAmountAfterTaxes2 {
    var totalAmountAfterTaxes = subTotal2 + taxesAmount2;
    return totalAmountAfterTaxes;
  }
}




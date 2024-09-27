class CartModel {
  List<String>? items;
  double? totalPrice;
  String? gram;

  CartModel({this.items, this.totalPrice, this.gram});
}

List<CartModel> gramList = [
  CartModel(gram: '1g'),
  CartModel(gram: '3.5g'),
  CartModel(gram: '7g'),
  CartModel(gram: '14g'),
  CartModel(gram: '28g'),
];

import 'package:new_weedus/export.dart';

class TrackingViewOrderCardView extends StatelessWidget {
  const TrackingViewOrderCardView({Key? key, this.product}) : super(key: key);
  final Product? product;

  @override
  Widget build(BuildContext context) {
    var _finalPrice;
    if (product!.discount != null) {
      var _discount = product!.price! * product!.discount! / 100;
      _finalPrice = product!.price! - _discount;
    }
    return TrackingViewOrderCardBuildWidgets.buildWidgets(
        product!, _finalPrice);
  }
}

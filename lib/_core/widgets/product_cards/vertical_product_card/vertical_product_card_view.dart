import 'package:new_weedus/export.dart';

class VerticalProductCardView extends StatefulWidget {
  VerticalProductCardView(
      {Key? key, this.product, this.isDispensaryView = false})
      : super(key: key);
  final bool? isDispensaryView;
  final Product? product;

  @override
  State<VerticalProductCardView> createState() =>
      _VerticalProductCardViewState();
}

class _VerticalProductCardViewState extends State<VerticalProductCardView>
    with VerticalProductCardMixin {
  @override
  Widget build(BuildContext context) {
    var _cart = context.watch<CartState>();
    return ConstrainedBox(
      constraints: constraints,
      child: Container(
        width: containerWidth,
        decoration: decoration,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: defaultSize * 1.5, horizontal: defaultSize / 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetVerticalCardWidget.productInfoColumn(
                      context, widget.product!, flOzTitle, slash, mlTitle),
                  GetVerticalCardWidget.thcAndCbd(
                      widget.product!, thcTitle, cbdTitle),
                ],
              ),
            ),
            _addProductButton(_cart),
            GetVerticalCardWidget.strainWidget(widget.product!, indicaTitle,
                sativaTitle, hybridTitle, cbdTitle),
          ],
        ),
      ),
    );
  }

  Positioned _addProductButton(CartState cart) {
    return Positioned(
        top: halfDefaultSize,
        right: halfDefaultSize,
        child: AppViewWidgets.customInkWell(
            onTap: () => addProduct(context,cart),
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: quarterDefaultSize, horizontal: halfDefaultSize),
                decoration: BoxDecoration(
                  color: effectsBoxColor,
                  //borderRadius: BorderRadius.circular(quarterDefaultSize)
                ),
                child:
                    Icon(Icons.add, color: effectsTextColor, size: iconSize))));
  }
}

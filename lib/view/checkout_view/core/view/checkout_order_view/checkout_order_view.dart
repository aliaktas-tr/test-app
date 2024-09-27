import 'package:new_weedus/export.dart';

class CheckOutOrderView extends StatelessWidget {
  const CheckOutOrderView({Key? key, this.cartState}) : super(key: key);
  final CartState? cartState;

  @override
  Widget build(BuildContext context) {
    CheckoutOrderViewModel viewModel = context.watch<CheckoutOrderViewModel>();
    return CheckoutOrderViewBuildWidgets.buildWidget(context,
        cartState: cartState,
        expand: viewModel.expand,
        cartOnTap: () => viewModel.cartOnTap(),
        taxIconTap: () => viewModel.taxIconTap(),
        displayAllTaxes: viewModel.displayAllTaxes);
  }
}

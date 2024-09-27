import 'package:new_weedus/export.dart';

class TrackingOrderView extends StatelessWidget {
  TrackingOrderView({super.key});

  final TrackingOrderViewModel _viewModel = TrackingOrderViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.formatAndSetOrderList();
    final _cart = context.watch<CartState>();
    return TrackingOrderViewBuildWidgets.buildWidget(_cart);
  }
}

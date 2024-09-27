import 'package:new_weedus/export.dart';

class MonogramView extends StatefulWidget {
  const MonogramView({super.key});

  @override
  State<MonogramView> createState() => _MonogramViewState();
}

class _MonogramViewState extends State<MonogramView> with MonogramMixin {
  ScrollController? horizontalScrollController = ScrollController();
  ScrollController? verticalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    CartState _cartState = Provider.of<CartState>(context);
    return MonogramBuildWidgets.buildWidgets(context,this,
        cartState: _cartState,
        verticalScrollController: verticalScrollController,
        horizontalScrollController: horizontalScrollController);
  }
}

import 'package:new_weedus/export.dart';

class LandingProductState extends ChangeNotifier {
  int flowerIndex = 0;

  Future<void> nextFlowerIndex({AutoScrollController? controller}) {
    flowerIndex = (flowerIndex + 1) % flowersProducts.length;
    return _scrollToFlowerIndex(controller!);
  }

  Future previousFlowerIndex({AutoScrollController? controller}) {
    flowerIndex = (flowerIndex - 1) % flowersProducts.length;
    return _scrollToFlowerIndex(controller!);
  }

  Future _scrollToFlowerIndex(AutoScrollController controller) async {
    await controller.scrollToIndex(flowerIndex,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(flowerIndex);
  }

  int prorollIndex = 0;

  Future<void> nextPrerollIndex({AutoScrollController? controller}) {
    prorollIndex = (prorollIndex + 1) % preRollProducts.length;
    return _scrollToPrerollIndex(controller!);
  }

  Future previousPrerollIndex({AutoScrollController? controller}) {
    prorollIndex = (prorollIndex - 1) % preRollProducts.length;
    return _scrollToPrerollIndex(controller!);
  }

  Future _scrollToPrerollIndex(AutoScrollController controller) async {
    await controller.scrollToIndex(prorollIndex,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(prorollIndex);
  }


  int concentratesIndex = 0;

  Future<void> nextConcentratesIndex({AutoScrollController? controller}) {
    concentratesIndex = (concentratesIndex + 1) % concentratesProducts.length;
    return _scrollToConcentratesIndex(controller!);
  }

  Future previousConcentratesIndex({AutoScrollController? controller}) {
    concentratesIndex = (concentratesIndex - 1) % concentratesProducts.length;
    return _scrollToConcentratesIndex(controller!);
  }

  Future _scrollToConcentratesIndex(AutoScrollController controller) async {
    await controller.scrollToIndex(concentratesIndex,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(concentratesIndex);
  }

}

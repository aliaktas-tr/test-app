import 'package:new_weedus/export.dart';

class SliderBuildWidget {
  static Widget getDefaultThumbSlider({Key? key}) {
    return Container(
      key: key,
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(1, 1))
          ]),
    );
  }

  static Widget getDefaultLabel(
      bool isPriceRange, int lowerValue, int upperValue,
      {bool isLeft = true}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: halfDefaultSize, horizontal: 2),
        child: isPriceRange
            ? AppViewWidgets.textMontserrat(
                isLeft ? "\$$lowerValue" : "\$$upperValue",
                color: nero,
                fontWeight: FontWeight.w500,
                fontSize: 13)
            : AppViewWidgets.textMontserrat(
                isLeft ? "$lowerValue%" : "$upperValue%",
                color: nero,
                fontWeight: FontWeight.w500,
                fontSize: 13));
  }
}

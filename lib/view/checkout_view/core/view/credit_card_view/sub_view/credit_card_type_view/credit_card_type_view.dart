import 'package:new_weedus/export.dart';

class CreditCardTypeView extends StatefulWidget {
  const CreditCardTypeView({
    Key? key,
    required this.cardNumber,
    this.obscureCardNumber = true,
    this.cardType,
  }) : super(key: key);

  final String cardNumber;
  final bool obscureCardNumber;
  final CreditCardType? cardType;

  @override
  CreditCardTypeWidgetState createState() => CreditCardTypeWidgetState();
}

class CreditCardTypeWidgetState extends State<CreditCardTypeView>
    with SingleTickerProviderStateMixin {
  bool isAmex = false;
  CreditCardTypeViewModel _creditCardTypeViewModel = CreditCardTypeViewModel();

  @override
  Widget build(BuildContext context) {
    return _buildFrontContainer();
  }

  Widget _buildFrontContainer() {
    return getCardTypeIcon(widget.cardNumber);
  }

  Widget getCardTypeIcon(String cardNumber) {
    Widget icon;
    final CreditCardType ccType =
        _creditCardTypeViewModel.detectCCType(cardNumber);

    switch (ccType) {
      case CreditCardType.visa:
        icon = SvgPicture.asset('assets/card_icons/visa.svg', height: 16);
        break;

      case CreditCardType.americanExpress:
        icon = SvgPicture.asset('assets/card_icons/american-express.svg',
            height: 24);
        break;

      case CreditCardType.mastercard:
        icon = Image.asset('assets/card_icons/mastercard.png', height: 24);
        break;

      case CreditCardType.unionpay:
      case CreditCardType.discover:
      case CreditCardType.elo:
      case CreditCardType.hipercard:
        icon = Image.asset(CardTypeIconAsset[ccType]!,
            height: 24, package: 'flutter_credit_card');
        isAmex = false;
        break;

      default:
        icon = Container();
        isAmex = false;
        break;
    }

    return icon;
  }
}


enum CreditCardType {
  otherBrand,
  mastercard,
  visa,
  americanExpress,
  unionpay,
  discover,
  elo,
  hipercard,
}

class CreditCardTypeViewModel {

   Map<CreditCardType, String> cardTypeIconAsset = <CreditCardType, String>{
    CreditCardType.visa: 'icons/visa.png',
    CreditCardType.americanExpress: 'icons/amex.png',
    CreditCardType.mastercard: 'icons/mastercard.png',
    CreditCardType.unionpay: 'icons/unionpay.png',
    CreditCardType.discover: 'icons/discover.png',
    CreditCardType.elo: 'icons/elo.png',
    CreditCardType.hipercard: 'icons/hipercard.png',
  };



  Map<CreditCardType, Set<List<String>>> cardNumPatterns =
      <CreditCardType, Set<List<String>>>{
    CreditCardType.visa: <List<String>>{
      <String>['4'],
    },
    CreditCardType.americanExpress: <List<String>>{
      <String>['34'],
      <String>['37'],
    },
    CreditCardType.unionpay: <List<String>>{
      <String>['62'],
    },
    CreditCardType.discover: <List<String>>{
      <String>['6011'],
      <String>['622126', '622925'],
      <String>['644', '649'],
      <String>['65']
    },
    CreditCardType.mastercard: <List<String>>{
      <String>['51', '55'],
      <String>['2221', '2229'],
      <String>['223', '229'],
      <String>['23', '26'],
      <String>['270', '271'],
      <String>['2720'],
    },
    CreditCardType.elo: <List<String>>{
      <String>['401178'],
      <String>['401179'],
      <String>['438935'],
      <String>['457631'],
      <String>['457632'],
      <String>['431274'],
      <String>['451416'],
      <String>['457393'],
      <String>['504175'],
      <String>['506699', '506778'],
      <String>['509000', '509999'],
      <String>['627780'],
      <String>['636297'],
      <String>['636368'],
      <String>['650031', '650033'],
      <String>['650035', '650051'],
      <String>['650405', '650439'],
      <String>['650485', '650538'],
      <String>['650541', '650598'],
      <String>['650700', '650718'],
      <String>['650720', '650727'],
      <String>['650901', '650978'],
      <String>['651652', '651679'],
      <String>['655000', '655019'],
      <String>['655021', '655058']
    },
    CreditCardType.hipercard: <List<String>>{
      <String>['606282'],
    },
  };

  CreditCardType detectCCType(String cardNumber) {
    CreditCardType cardType = CreditCardType.otherBrand;

    if (cardNumber.isEmpty) {
      return cardType;
    }

    cardNumPatterns.forEach(
      (CreditCardType type, Set<List<String>> patterns) {
        for (List<String> patternRange in patterns) {
          String ccPatternStr =
              cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');
          final int rangeLen = patternRange[0].length;
          if (rangeLen < cardNumber.length) {
            ccPatternStr = ccPatternStr.substring(0, rangeLen);
          }

          if (patternRange.length > 1) {
            final int ccPrefixAsInt = int.parse(ccPatternStr);
            final int startPatternPrefixAsInt = int.parse(patternRange[0]);
            final int endPatternPrefixAsInt = int.parse(patternRange[1]);
            if (ccPrefixAsInt >= startPatternPrefixAsInt &&
                ccPrefixAsInt <= endPatternPrefixAsInt) {
              cardType = type;
              break;
            }
          } else {
            if (ccPatternStr == patternRange[0]) {
              cardType = type;
              break;
            }
          }
        }
      },
    );

    return cardType;
  }
}

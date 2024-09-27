import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'package:new_weedus/export.dart';

class UserView extends StatefulWidget {
  const UserView({super.key, required this.userModel, required this.authState});

  final UserModel userModel;
  final AuthState authState;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  bool _isMmjEdit = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _mmjIDController = TextEditingController();
  TextEditingController _mmjIssuedController = TextEditingController();
  TextEditingController _mmjExpiresController = TextEditingController();
  TextEditingController _mmjNameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = Provider.of<SignUpViewModel>(context);
    UserViewModel userViewModel = Provider.of<UserViewModel>(context);
    return SingleChildScrollView(
        child: _userCard(widget.userModel, signUpViewModel, widget.authState,
            userViewModel));
  }

  SizedBox _userCard(UserModel userModel, SignUpViewModel signUpViewModel,
          AuthState authState, UserViewModel userViewModel) =>
      SizedBox(
          width: context.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(userViewModel.isProfileEdit ? 'Edit Profile' : 'Profile',
                      style:
                          GoogleFonts.michroma(fontSize: 20, color: appColor)),
                  AppViewWidgets.customInkWell(
                      onTap: () {
                        userViewModel.setProfileEdit =
                            !userViewModel.isProfileEdit;
                      },
                      child: Icon(Icons.settings, color: appColor))
                ],
              ),
              SizedBox(height: defaultSize),
              Container(
                  child: userViewModel.isProfileEdit
                      ? Column(
                          children: [
                            userModel.profileImage == null ||
                                    userModel.profileImage == ''
                                ? Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: appColor, width: 2)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AppViewWidgets.customImage(
                                            height: 70, profileAvatar),
                                      ),
                                    ))
                                : AppViewWidgets.customImage(
                                    height: 70, userModel.profileImage),
                            SizedBox(height: doubleDefaultSize),
                            Container(
                              padding: const EdgeInsets.all(halfDefaultSize),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(halfDefaultSize),
                                  color: effectsBoxColor),
                              child: _testTitleTextField(
                                  hintText: userModel.displayName,
                                  labelText: 'Full name',
                                  isEnable: true,
                                  autoFocus: true,
                                  controller: _nameController),
                            ),
                            SizedBox(height: halfDefaultSize),
                            Container(
                              padding: const EdgeInsets.all(halfDefaultSize),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(halfDefaultSize),
                                  color: effectsBoxColor),
                              child: _testTitleTextField(
                                  isEnable: false,
                                  labelText: 'DOB',
                                  controller: _dobController),
                            ),
                            SizedBox(height: halfDefaultSize),
                            Container(
                              padding: const EdgeInsets.all(halfDefaultSize),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(halfDefaultSize),
                                  color: effectsBoxColor),
                              child: _testTitleTextField(
                                  labelText: 'Phone number',
                                  isEnable: true,
                                  autoFocus: true,
                                  controller: _phoneNumberController),
                            ),
                            SizedBox(height: halfDefaultSize),
                            Container(
                              padding: const EdgeInsets.all(halfDefaultSize),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(halfDefaultSize),
                                  color: effectsBoxColor),
                              child: _testTitleTextField(
                                  labelText: 'Address',
                                  isEnable: true,
                                  autoFocus: true,
                                  controller: _addressController),
                            )
                          ],
                        )
                      : Column(children: [
                          userModel.profileImage == null ||
                                  userModel.profileImage == ''
                              ? Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: appColor, width: 2)),
                                  child: Center(
                                    child: AppViewWidgets.textMontserrat(
                                        textAlign: TextAlign.center,
                                        userModel.displayName![0].toUpperCase(),
                                        color: nero,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ))
                              : AppViewWidgets.customImage(
                                  height: 70, userModel.profileImage),
                          SizedBox(height: doubleDefaultSize),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _titleText('Name', userModel.displayName!),
                                _titleText('DOB', userModel.dob ?? ''),
                                _titleText(
                                    'Phone', userModel.phoneNumber ?? ''),
                                _titleText('Address', userModel.address ?? ''),
                                _titleText('MMJ', userModel.address ?? ''),
                                SizedBox(height: defaultSize),
                              ]),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // _logoutButton(authState),
                                    AppViewWidgets.textMontserrat(
                                        userModel.createdAt != null
                                            ? Utility.getJoiningDate(
                                                userModel.createdAt!)
                                            : '',
                                        color: nero,
                                        fontSize: 12),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ])),
              SizedBox(height: defaultSize),
              AppViewWidgets.appDivider(height: 0),
              SizedBox(height: defaultSize),
              PaymentExpandableHeader(
                  child: Container(
                      padding: const EdgeInsets.all(defaultSize),
                      width: context.width,
                      child: _cardBuildWidget())),
              SizedBox(height: defaultSize),
              AppViewWidgets.appDivider(height: 0),
              SizedBox(height: defaultSize),
              userViewModel.isProfileEdit
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Your Orders',
                                style: GoogleFonts.michroma(
                                    fontSize: 20, color: appColor)),
                          ],
                        ),
                        SizedBox(height: defaultSize),
                        Container(
                          padding: const EdgeInsets.all(defaultSize),
                          width: context.width,
                          constraints: BoxConstraints(minHeight: 200),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(defaultSize),
                              color: nero),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppViewWidgets.textMontserrat(
                                  'No orders available.',
                                  color: scaffoldBackgroundColor)
                            ],
                          ),
                        ),
                      ],
                    ),
              CryptoPaymentScreen()
            ],
          ));
  List<String> _cardLogoPaths = [
    'assets/card_icons/cards/amazon-pay.svg',
    'assets/card_icons/cards/apple-pay.svg',
    'assets/card_icons/cards/google-pay.svg',
    'assets/card_icons/cards/visa-electron.svg',
    'assets/card_icons/cards/american-express.svg',
    'assets/card_icons/cards/mastercard2.svg',
    'assets/card_icons/cards/usdt.svg',
    'assets/card_icons/cards/paypal.svg'
  ];

  Widget _cardBuildWidget() => Wrap(
      spacing: 16,
      runSpacing: 16,
      direction: Axis.horizontal,
      /* shrinkWrap: true,
      desiredItemWidth: 75,*/
      children: List.generate(_cardLogoPaths.length,
          (index) => SvgPicture.asset(_cardLogoPaths[index], height: 40)));

  static Widget _nameFormBuilder(
          SignUpViewModel signUpViewModel, AuthState authState,
          {String? hintText,
          TextEditingController? controller,
          bool? autoFocus}) =>
      _EditForm(
          enabled: !signUpViewModel.loading,
          hintText: hintText,
          controller: controller,
          autoFocus: autoFocus,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          maxLines: null,
          validateFunction: Validations.validateName);

  Widget _titleTextField(SignUpViewModel signUpViewModel, AuthState authState,
          {String? title,
          String? hintText,
          bool? autoFocus,
          TextEditingController? controller}) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 130,
              child: _text(title!, color: effectsBoxColor, fontSize: 14)),
          _text(': ', color: effectsBoxColor, fontSize: 14),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: _nameFormBuilder(signUpViewModel, authState,
                hintText: hintText,
                controller: controller,
                autoFocus: autoFocus),
          ))
        ],
      );

  Widget _testTitleTextField(
          {String? hintText,
          String? labelText,
          bool? autoFocus,
          TextEditingController? controller,
          bool? isEnable}) =>
      TestForm(
          hintText: hintText,
          labelText: labelText,
          controller: controller,
          autoFocus: autoFocus,
          enabled: isEnable);

  Widget _text(String text,
          {Color? color, FontWeight? fontWeight, double? fontSize}) =>
      AppViewWidgets.textMontserrat(text,
          fontWeight: fontWeight, fontSize: fontSize ?? 16, color: color);

  Row _titleText(String title, String text, {Color? color}) => Row(children: [
        SizedBox(width: 90, child: _text(title, color: nero05, fontSize: 14)),
        _text(': ', color: nero05, fontSize: 14),
        Expanded(
            child: _text(text,
                color: color ?? nero,
                fontSize: 14,
                fontWeight: FontWeight.w500))
      ]);

  Widget _logoutButton(AuthState authState) => CustomTextButton(
      overlayColor: WidgetStateProperty.all(nero),
      hoveredColor: effectsBoxColor,
      padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
          EdgeInsets.symmetric(horizontal: halfDefaultSize)),
      child: Row(
        children: [
          AppViewWidgets.textMontserrat('Logout', fontSize: 16),
          SizedBox(width: halfDefaultSize),
          Icon(Icons.logout)
        ],
      ),
      onTap: () {
        authState.signOut();
        SmartDialog.dismiss(force: true);
      });

  Widget _saveButton() => CustomTextButton(
      overlayColor: WidgetStateProperty.all(nero),
      hoveredColor: effectsBoxColor,
      padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
          EdgeInsets.symmetric(horizontal: halfDefaultSize)),
      child: Row(
        children: [
          AppViewWidgets.textMontserrat('Save', fontSize: 16),
          SizedBox(width: halfDefaultSize),
          Icon(Icons.check)
        ],
      ),
      onTap: () {});
}

class CryptoPaymentScreen extends StatefulWidget {
  @override
  _CryptoPaymentScreenState createState() => _CryptoPaymentScreenState();
}

class _CryptoPaymentScreenState extends State<CryptoPaymentScreen> {
  String apiKey =
      'f9504e2d-a414-4b60-a5ec-825866019837'; // Replace with your actual API key
  String chargeId = ''; // To store the charge ID
  String paymentStatus = 'Pending'; // To track the payment status

  // Function to create a charge using Coinbase Commerce API
  Future<void> createCharge() async {
    final url = Uri.parse(
        'https://api.commerce.coinbase.com/charges'); // Coinbase Commerce charge API endpoint
    final headers = {
      'Content-Type': 'application/json',
      'X-CC-Api-Key': apiKey,
      'X-CC-Version': '2018-03-22', // Coinbase API version
    };

    // Charge request body
    final body = jsonEncode({
      'name': 'Test Product',
      // Product name
      'description': 'Sample product for testing',
      // Product description
      'pricing_type': 'fixed_price',
      // Fixed price or dynamic price
      'local_price': {'amount': '10.00', 'currency': 'USD'},
      // Payment amount and currency
      'metadata': {'order_id': 'order_1234'},
      // Optional metadata for tracking
      'redirect_url': 'https://your-app.com/redirect',
      // Redirect URL after successful payment
      'cancel_url': 'https://your-app.com/cancel',
      // Redirect URL if user cancels
    });

    try {
      // Make a POST request to Coinbase Commerce API
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 201) {
        // Successful charge creation
        final data = jsonDecode(response.body);
        setState(() {
          chargeId = data['data']['id']; // Store the charge ID
        });

        // Get the hosted URL for the payment
        final hostedUrl = data['data']['hosted_url'];

        // Open the Coinbase payment page in a new browser tab
        html.window
            .open(hostedUrl, '_blank'); // _blank opens the URL in a new tab
      } else {
        // Handle failure in creating charge
        print('Failed to create charge: ${response.body}');
      }
    } catch (e) {
      print('Error: $e'); // Print error if the request fails
    }
  }

  // Fetch payment status (optional)
  Future<void> fetchPaymentStatus() async {
    if (chargeId.isEmpty) return; // Exit if no charge ID is available

    final url = Uri.parse(
        'https://api.commerce.coinbase.com/charges/$chargeId'); // API to fetch charge details
    final headers = {
      'Content-Type': 'application/json',
      'X-CC-Api-Key': apiKey,
      'X-CC-Version': '2018-03-22',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          // Update the payment status based on the latest charge timeline
          paymentStatus = data['data']['timeline'].last['status'];
        });
        print('Payment status: $paymentStatus');
      } else {
        print('Failed to fetch payment status: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: createCharge, // Create charge on button press
            child: Text('Pay with Crypto'),
          ),
          SizedBox(height: 20),
          Text('Payment Status: $paymentStatus'), // Display payment status
          ElevatedButton(
            onPressed: fetchPaymentStatus, // Fetch the payment status
            child: Text('Check Payment Status'),
          ),
        ],
      ),
    );
  }
}

class DateTextInputFormatter extends TextInputFormatter {
  final TextEditingController dobController;

  DateTextInputFormatter(this.dobController);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Get the new input text
    String text = newValue.text;

    // If user is deleting, return the text as is
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // Automatically insert slashes after MM and dd
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      // Automatically insert "/" after MM and dd
      if ((i == 1 || i == 4) && text.length > i + 1) {
        buffer.write('/');
      }
    }

    // Update the selection cursor position
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

Widget _dobField(TextEditingController dobController) {
  return TextFormField(
    controller: dobController,
    decoration: const InputDecoration(
      labelText: 'DOB (MM/dd/yyyy)',
      border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.datetime,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      // Allow only numbers
      LengthLimitingTextInputFormatter(10),
      // Limit input to 10 characters
      DateTextInputFormatter(dobController),
      // Custom formatter to insert slashes
    ],
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter DOB';
      }

      try {
        DateTime parsedDate = DateFormat('MM/dd/yyyy').parseStrict(value);
        if (!_isValidAge(parsedDate)) {
          return 'You must be at least 18 years old';
        }
      } catch (e) {
        return 'Enter a valid date in MM/dd/yyyy format';
      }

      return null;
    },
  );
}

bool _isValidAge(DateTime date) {
  final today = DateTime.now();
  final age = today.year - date.year;
  final isBirthdayPassed = (today.month > date.month ||
      (today.month == date.month && today.day >= date.day));

  return age > 18 || (age == 18 && isBirthdayPassed);
}

class _EditFormWidgets {
  static final double _halfWidthBorderValue = 0.5;
  static final double _borderWidthValue = 1.0;
  static final double _sizeValue = 15;
  static final double _suffixIconSize = 18;
  static final int _darkenValue = 20;
  static final double _zeroValue = 0.0;
  static final Color _color = nero;
  static final double _minWidth = 30;
  static final double _maxHeight = 25;
  static final BoxConstraints _prefixIconConstraints =
      BoxConstraints(minWidth: _minWidth, maxHeight: _maxHeight);

  static TextStyle get textFieldTextStyle => GoogleFonts.montserrat(
      fontSize: 14, color: effectsBoxColor, fontWeight: FontWeight.w500);

  static UnderlineInputBorder get _border => UnderlineInputBorder(
      borderSide: BorderSide(color: _color, width: _halfWidthBorderValue));

  static UnderlineInputBorder get _focusBorder => UnderlineInputBorder(
      borderSide: BorderSide(color: effectsBoxColor, width: _borderWidthValue));

  static TextStyle _textFieldHintStyle = GoogleFonts.montserrat(
      color: effectsBoxColor, fontSize: 14, fontWeight: FontWeight.w500);

  static InputDecoration decoration(BuildContext context,
          {IconData? prefix, String? hintText, IconData? suffix}) =>
      InputDecoration(
          filled: false,
          isDense: true,
          hintText: hintText,
          hintStyle: _textFieldHintStyle,
          contentPadding: EdgeInsets.symmetric(vertical: 1),
          enabledBorder: InputBorder.none,
          focusedBorder: _focusBorder,
          border: InputBorder.none,
          errorStyle: TextStyle(height: _zeroValue, fontSize: _zeroValue));
}

class _EditForm extends StatefulWidget {
  final String? initialValue;
  final bool? enabled;
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved, onChange;
  final Key? key;
  final IconData? prefix;
  final IconData? suffix;
  final int? maxLines;
  final bool? autoFocus;

  _EditForm(
      {this.prefix,
      this.suffix,
      this.initialValue,
      this.enabled,
      this.hintText,
      this.textInputType,
      this.controller,
      this.textInputAction,
      this.nextFocusNode,
      this.focusNode,
      this.submitAction,
      this.obscureText = false,
      this.validateFunction,
      this.onSaved,
      this.onChange,
      this.key,
      this.textCapitalization,
      this.maxLines,
      this.autoFocus});

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<_EditForm> with _EditFormMixin {
  @override
  Widget build(BuildContext context) {
    return _formField;
  }

  Widget get _formField => TextFormField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: effectsBoxColor,
      cursorHeight: 19,
      maxLines: widget.maxLines,
      autofocus: widget.autoFocus ?? false,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      style: _EditFormWidgets.textFieldTextStyle,
      key: widget.key,
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      validator: widget.validateFunction,
      onSaved: (val) => onSaved(val),
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: (String term) => onFieldSubmitted(term),
      decoration: _decoration);

  InputDecoration get _decoration => _EditFormWidgets.decoration(context,
      hintText: widget.hintText, prefix: widget.prefix, suffix: widget.suffix);

  Widget get _errorWidget => FormErrorVisibility(error: error);
}

mixin _EditFormMixin on State<_EditForm> {
  String? _error;

  void onChanged(val) {
    _error = widget.validateFunction!(val);
    setState(() {});
    widget.onSaved!(val);
  }

  void onSaved(val) {
    _error = widget.validateFunction!(val);
    setState(() {});
    widget.onSaved!(val!);
  }

  void onFieldSubmitted(String term) {
    if (widget.nextFocusNode != null) {
      widget.focusNode!.unfocus();
      FocusScope.of(context).requestFocus(widget.nextFocusNode);
    } else {
      widget.submitAction!();
    }
  }

  String get error => _error ?? '';
}

class TestForm extends StatefulWidget {
  final String? initialValue;
  final bool? enabled;
  final String? hintText;
  final String? labelText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved, onChange;
  final Key? key;
  final IconData? prefix;
  final IconData? suffix;
  final int? maxLines;
  final bool? autoFocus;
  final List<TextInputFormatter>? inputFormatters;

  TestForm(
      {this.prefix,
      this.suffix,
      this.initialValue,
      this.enabled = true,
      this.hintText,
      this.labelText,
      this.textInputType,
      this.controller,
      this.textInputAction,
      this.nextFocusNode,
      this.focusNode,
      this.submitAction,
      this.obscureText = false,
      this.validateFunction,
      this.onSaved,
      this.onChange,
      this.key,
      this.textCapitalization,
      this.maxLines,
      this.autoFocus,
      this.inputFormatters});

  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> with _TestFormMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 38, child: _formField);
  }

  Widget get _formField => TextFormField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: nero,
      cursorHeight: 19,
      inputFormatters: widget.inputFormatters,
      autofocus: widget.autoFocus ?? false,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      initialValue: widget.initialValue,
      enabled: widget.enabled ?? true,
      style: GoogleFonts.montserrat(color: nero),
      key: widget.key,
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      validator: widget.validateFunction,
      onSaved: (val) => onSaved(val),
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: (String term) => onFieldSubmitted(term),
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 2),
          isDense: true,
          labelText: widget.labelText,
          hintText: widget.hintText,
          labelStyle: GoogleFonts.montserrat(color: nero),
          hintStyle: GoogleFonts.montserrat(color: nero05),
          border: widget.enabled!
              ? UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  borderSide: BorderSide(color: appColor, width: 0.5))
              : InputBorder.none,
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(0.0),
              borderSide: BorderSide(color: effectsBoxColor, width: 0.0)),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(0.0),
              borderSide: BorderSide(color: effectsBoxColor, width: 0.0)),
          hoverColor: nero));

  InputDecoration get _decoration => _EditFormWidgets.decoration(context,
      hintText: widget.hintText, prefix: widget.prefix, suffix: widget.suffix);

  Widget get _errorWidget => FormErrorVisibility(error: error);
}

mixin _TestFormMixin on State<TestForm> {
  String? _error;

  void onChanged(val) {
    _error = widget.validateFunction!(val);
    setState(() {});
    widget.onSaved!(val);
  }

  void onSaved(val) {
    _error = widget.validateFunction!(val);
    setState(() {});
    widget.onSaved!(val!);
  }

  void onFieldSubmitted(String term) {
    if (widget.nextFocusNode != null) {
      widget.focusNode!.unfocus();
      FocusScope.of(context).requestFocus(widget.nextFocusNode);
    } else {
      widget.submitAction!();
    }
  }

  String get error => _error ?? '';
}

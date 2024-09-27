import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:new_weedus/export.dart';

/*class AccountDetailViewBuildWidgets {
  static final String _title = 'My Account';
  static final double _titleFontSize = 30;
  static final double _fieldWhiteSpaceSize = 18;
  static final double _whiteSpaceBetweenFields = 12;
  static final EdgeInsetsGeometry _fieldPadding = EdgeInsets.all(10);

  static Widget buildWidget(AuthState authState, UserSettingsMixin mixin) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppViewWidgets.textMontserrat(_title,
              fontSize: _titleFontSize, fontWeight: FontWeight.w600),
          SizedBox(height: _whiteSpaceBetweenFields),
          _textFields(authState, mixin),
        ],
      );

  static Widget _textFields(AuthState authState, UserSettingsMixin mixin) =>
      Container(
        color: scaffoldBackgroundColor,
        child: Column(
          children: [
            SizedBox(height: _fieldWhiteSpaceSize),
            ...List.generate(
                _fieldLabelList.length,
                (index) => Column(children: [
                      Container(
                          padding: _fieldPadding,
                          color: effectsBoxColor,
                          child: _testTitleTextField(
                              hintText: _fieldHintList(authState)[index],
                              labelText: _fieldLabelList[index],
                              isEnable: index == 1 || index == 3 ? false : true,
                              autoFocus:
                                  index == 1 || index == 3 ? false : true,
                              controller: mixin.controllers[index])),
                      _halfHeightSizeBox
                    ]))
          ],
        ),
      );

  static Widget _testTitleTextField(
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

  static List<String> _fieldLabelList = [
    'Full name',
    'Phone number',
    'Address',
    'Date of Birth'
  ];

  static List<String> _fieldHintList(AuthState authState) => [
        authState.userModel!.displayName ?? 'Full name',
        authState.userModel!.phoneNumber ?? 'add Phone number',
        authState.userModel!.address ?? 'add Address',
        authState.userModel!.dob ?? 'add Date of birth'
      ];

  static SizedBox get _halfHeightSizeBox => SizedBox(height: halfDefaultSize);
}*/

/*class AccountDetailViewBuildWidgets {
  static const String _title = 'My Account';
  static const double _titleFontSize = 30;
  static const double _fieldWhiteSpaceSize = 18;
  static const double _whiteSpaceBetweenFields = 12;
  static const EdgeInsetsGeometry _fieldPadding = EdgeInsets.all(10);

  static Widget buildWidget(AuthState authState, UserSettingsMixin mixin) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppViewWidgets.textMontserrat(
          _title,
          fontSize: _titleFontSize,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: _whiteSpaceBetweenFields),
        _textFields(authState, mixin),
      ],
    );
  }

  static Widget _textFields(AuthState authState, UserSettingsMixin mixin) {
    return Container(
        color: scaffoldBackgroundColor,
        child: Column(children: [
          SizedBox(height: _fieldWhiteSpaceSize),
          ...List.generate(_fieldLabelList.length, (index) {
            return Column(children: [
              AppViewWidgets.customInkWell(
                onTap:(){},
                child: Container(
                    padding: _fieldPadding,
                    color: effectsBoxColor,
                    child: _testTitleTextField(
                        hintText: _fieldHintList(authState)[index],
                        labelText: _fieldLabelList[index],
                        isEnable: _isFieldEnabled(index),
                        autoFocus: _shouldAutoFocus(index),
                        controller: mixin.controllers[index])),
              ),
              _halfHeightSizeBox
            ]);
          })
        ]));
  }



  static bool _isFieldEnabled(int index) => !(index == 1 || index == 3);

  static bool _shouldAutoFocus(int index) => !(index == 1 || index == 3);

  static Widget _testTitleTextField({
    required String? hintText,
    required String? labelText,
    required bool autoFocus,
    required TextEditingController controller,
    required bool isEnable,
  }) {
    return TestForm(
      hintText: hintText,
      labelText: labelText,
      controller: controller,
      autoFocus: autoFocus,
      enabled: isEnable,
    );
  }

  static const List<String> _fieldLabelList = [
    'Full name',
    'Phone number',
    'Address',
    'Date of Birth',
  ];

  static List<String> _fieldHintList(AuthState authState) {
    return [
      authState.userModel?.displayName ?? 'Full name',
      authState.userModel?.phoneNumber ?? 'Add Phone number',
      authState.userModel?.address ?? 'Add Address',
      authState.userModel?.dob ?? 'Add Date of Birth',
    ];
  }

  static SizedBox get _halfHeightSizeBox => SizedBox(height: halfDefaultSize);
}*/

/*class AccountDetailViewBuildWidgets {
  static const String _title = 'My Account';
  static const double _titleFontSize = 30;
  static const double _fieldWhiteSpaceSize = 18;
  static const double _whiteSpaceBetweenFields = 12;
  static const EdgeInsetsGeometry _fieldPadding = EdgeInsets.all(10);
  static const int legalAge = 21;

  static Widget buildWidget(
      BuildContext context, AuthState authState, UserSettingsMixin mixin) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppViewWidgets.textMontserrat(
          _title,
          fontSize: _titleFontSize,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: _whiteSpaceBetweenFields),
        _textFields(context, authState, mixin),
      ],
    );
  }

  static Widget _textFields(
      BuildContext context, AuthState authState, UserSettingsMixin mixin) {
    return Container(
      color: scaffoldBackgroundColor,
      child: Column(
        children: [
          SizedBox(height: _fieldWhiteSpaceSize),
          ...List.generate(_fieldLabelList.length, (index) {
            return Column(
              children: [
                Container(
                  padding: _fieldPadding,
                  color: effectsBoxColor,
                  child: _testTitleTextField(
                    hintText: _fieldHintList(authState)[index],
                    labelText: _fieldLabelList[index],
                    isEnable: _isFieldEnabled(index),
                    autoFocus: _shouldAutoFocus(index),
                    controller: mixin.controllers[index],
                    onTap: _getOnTapCallback(context, index, mixin),
                  ),
                ),
                _halfHeightSizeBox,
              ],
            );
          }),
        ],
      ),
    );
  }

  // Returns whether the field is enabled for direct input.
  static bool _isFieldEnabled(int index) {
    // Disable fields at index 1 (Phone) and index 3 (Date of Birth)
    return !(index == 3);
  }

  // Returns whether the field should auto-focus.
  static bool _shouldAutoFocus(int index) {
    // Don't auto-focus on the fields that are disabled (index 1 and index 3)
    return !(index == 1 || index == 3);
  }

  // Return a VoidCallback for specific indexes (phone picker and date picker).
  static VoidCallback? _getOnTapCallback(
      BuildContext context, int index, UserSettingsMixin mixin) {
    if (index == 3) {
      // Return a callback to show the date picker for index 3 (Date of Birth)
      return () => _showDatePicker(context, mixin);
    }
    return null;
  }

  // Mask formatter for US phone number (optional)
  static final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static void _showDatePicker(BuildContext context, UserSettingsMixin mixin) {
    final DateTime today = DateTime.now();
    final DateTime legalAgeDate =
        DateTime(today.year - legalAge, today.month, today.day);

    // Show the custom date picker inside SmartDialog
    SmartDialog.show(
      builder: (context) => _customDatePicker(context, legalAgeDate, mixin),
    );
  }

  // Custom date picker widget that will be shown inside SmartDialog
  static Widget _customDatePicker(
      BuildContext context, DateTime initialDate, UserSettingsMixin mixin) {
    return AlertDialog(
      title: Text("Select Date of Birth"),
      shape: RoundedRectangleBorder(),
      content: Container(
        width: 450,
        height: 300,
        child: CalendarDatePicker(
          initialDate: initialDate,
          firstDate: DateTime(1900),
          lastDate: initialDate,
          onDateChanged: (selectedDate) {
            print('Selected Date: $selectedDate');
            // Update the date controller or mixin here with the selected date
            mixin.controllers[3].text =
                "${selectedDate.toLocal()}".split(' ')[0];
            SmartDialog.dismiss(); // Close the dialog once a date is selected
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            SmartDialog
                .dismiss(); // Dismiss the dialog without selecting a date
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  static Widget _testTitleTextField({
    required String? hintText,
    required String? labelText,
    required bool autoFocus,
    required TextEditingController controller,
    required bool isEnable,
    VoidCallback? onTap,
  }) {
    return AppViewWidgets.customInkWell(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: !isEnable,
        child: TestForm(
          hintText: hintText,
          labelText: labelText,
          controller: controller,
          autoFocus: autoFocus,
          enabled: isEnable,
        ),
      ),
    );
  }

  static const List<String> _fieldLabelList = [
    'Full name',
    'Phone number',
    'Address',
    'Date of Birth',
  ];

  static List<String> _fieldHintList(AuthState authState) {
    return [
      authState.userModel?.displayName ?? 'Full name',
      authState.userModel?.phoneNumber ?? 'Add Phone number',
      authState.userModel?.address ?? 'Add Address',
      authState.userModel?.dob ?? 'Add Date of Birth',
    ];
  }

  static SizedBox get _halfHeightSizeBox => SizedBox(height: halfDefaultSize);
}*/

class AccountDetailViewBuildWidgets {
  static const String _title = 'My Account';
  static const double _titleFontSize = 30;
  static const double _fieldWhiteSpaceSize = 18;
  static const double _whiteSpaceBetweenFields = 12;
  static const EdgeInsetsGeometry _fieldPadding = EdgeInsets.all(10);
  static const int legalAge = 21;

  // Mask formatter for US phone number
  static final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static Widget buildWidget(
      BuildContext context, AuthState authState, UserSettingsMixin mixin) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppViewWidgets.textMontserrat(
          _title,
          fontSize: _titleFontSize,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: _whiteSpaceBetweenFields),
        _textFields(context, authState, mixin),
      ],
    );
  }

  static Widget _textFields(
      BuildContext context, AuthState authState, UserSettingsMixin mixin) {
    return Container(
      color: scaffoldBackgroundColor,
      child: Column(
        children: [
          SizedBox(height: _fieldWhiteSpaceSize),
          ...List.generate(_fieldLabelList.length, (index) {
            return Column(
              children: [
                Container(
                  padding: _fieldPadding,
                  color: effectsBoxColor,
                  child: _testTitleTextField(
                    hintText: _fieldHintList(authState)[index],
                    labelText: _fieldLabelList[index],
                    isEnable: _isFieldEnabled(index),
                    autoFocus: _shouldAutoFocus(index),
                    controller: mixin.controllers[index],
                    onTap: _getOnTapCallback(context, index, mixin),
                    // Apply phoneFormatter for Phone Number field (index 1)
                    inputFormatters: index == 1 ? [phoneFormatter] : [],
                  ),
                ),
                _halfHeightSizeBox,
              ],
            );
          }),
        ],
      ),
    );
  }

  // Returns whether the field is enabled for direct input.
  static bool _isFieldEnabled(int index) {
    // Disable fields at index 3 (Date of Birth)
    return !(index == 3);
  }

  // Returns whether the field should auto-focus.
  static bool _shouldAutoFocus(int index) {
    // Don't auto-focus on the fields that are disabled (index 1 and index 3)
    return !(index == 1 || index == 3);
  }

  // Return a VoidCallback for specific indexes (date picker).
  static VoidCallback? _getOnTapCallback(
      BuildContext context, int index, UserSettingsMixin mixin) {
    if (index == 3) {
      // Return a callback to show the date picker for index 3 (Date of Birth)
      return () => _showDatePicker(context, mixin);
    }
    return null;
  }

  static void _showDatePicker(BuildContext context, UserSettingsMixin mixin) {
    final DateTime today = DateTime.now();
    final DateTime legalAgeDate =
        DateTime(today.year - legalAge, today.month, today.day);

    // Show the custom date picker inside SmartDialog
    SmartDialog.show(
      builder: (context) => _customDatePicker(context, legalAgeDate, mixin),
    );
  }


  static Widget _customDatePicker(
      BuildContext context, DateTime initialDate, UserSettingsMixin mixin) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: AppViewWidgets.textMontserrat("Select Date of Birth",
            fontWeight: FontWeight.bold, fontSize: 18),
        shape: RoundedRectangleBorder(),
        backgroundColor: scaffoldBackgroundColor,
        content: Container(
          width: 400,
          height: 250,
          child: Theme(
            data: Theme.of(context).copyWith(
                // Customize text style
                textTheme: TextTheme(
                    titleSmall: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500, fontSize: 16),
                    bodyLarge: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500, fontSize: 15)),
                colorScheme: ColorScheme.light(
                    primary: appColor,
                    onPrimary: nero,
                    onSurface: nero,
                    surface: Colors.grey.shade300)),
            child: CalendarDatePicker(
              initialDate: initialDate,
              firstDate: DateTime(1900),
              lastDate: initialDate,
              onDateChanged: (selectedDate) {
                mixin.controllers[3].text =
                    "${selectedDate.toLocal()}".split(' ')[0];
                SmartDialog.dismiss(); // Close dialog when date is selected
              },
            ),
          ),
        ),
        actions: [
          TextButton(
            style: _buttonStyle(overlayColor: WidgetStateProperty.all(appColor)),
            onPressed: () {
              SmartDialog.dismiss(); // Close the dialog
            },
            child: AppViewWidgets.textMontserrat('Cancel', color: nero),
          ),
        ],
      ),
    );
  }

  static ButtonStyle _buttonStyle(
      {WidgetStateProperty<Color?>? overlayColor,
      WidgetStateProperty<Color?>? backgroundColor,
      Color? hoveredColor}) {
    return ButtonStyle(
        overlayColor: overlayColor,
        padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(vertical: 4, horizontal: 8)),
        backgroundColor:
            backgroundColor ?? WidgetStateProperty.all(effectsBoxColor),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return hoveredColor;
            }
            return effectsTextColor;
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.zero)));
  }

  static Widget _testTitleTextField({
    required String? hintText,
    required String? labelText,
    required bool autoFocus,
    required TextEditingController controller,
    required bool isEnable,
    VoidCallback? onTap,
    List<TextInputFormatter>? inputFormatters, // Accept inputFormatters
  }) {
    return AppViewWidgets.customInkWell(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: !isEnable,
        child: TestForm(
          hintText: hintText,
          labelText: labelText,
          controller: controller,
          autoFocus: autoFocus,
          enabled: isEnable,
          inputFormatters: inputFormatters, // Apply input formatters
        ),
      ),
    );
  }

  static const List<String> _fieldLabelList = [
    'Full name',
    'Phone number',
    'Address',
    'Date of Birth',
  ];

  static List<String> _fieldHintList(AuthState authState) {
    return [
      authState.userModel?.displayName ?? 'Full name',
      authState.userModel?.phoneNumber ?? '(###) ###-####',
      authState.userModel?.address ?? 'Add Address',
      authState.userModel?.dob ?? 'Add Date of Birth',
    ];
  }

  static SizedBox get _halfHeightSizeBox => SizedBox(height: halfDefaultSize);
}

import 'package:new_weedus/export.dart';


class UploadProfileImageView extends StatefulWidget {
  const UploadProfileImageView({Key? key}) : super(key: key);

  @override
  _UploadProfileImageViewState createState() => _UploadProfileImageViewState();
}

class _UploadProfileImageViewState extends State<UploadProfileImageView>
    with UploadProfileImageMixin {

  @override
  Widget build(BuildContext context) {
    UploadProfileImageViewModel viewModel =
        Provider.of<UploadProfileImageViewModel>(context);
    SignUpViewModel signUpViewModel = Provider.of<SignUpViewModel>(context);
    AuthState authState = Provider.of<AuthState>(context, listen: false);
    return WillPopScope(
        onWillPop: () async => false,
        child: AuthViewWidgets.landingBackgroundWidget(
            child: _buildUi(viewModel, authState, signUpViewModel)));
  }

  Widget _buildUi(UploadProfileImageViewModel viewModel, AuthState authState,
          SignUpViewModel signUpViewModel) =>
      GestureDetector(
          onTap: () => pageOnTapIfBottomSheetTrue(viewModel),
          child: Scaffold(
              backgroundColor: Colors.transparent,

              /// stack for bottom sheet
              body: Stack(alignment: Alignment.center, children: [
                _buildUiWidgets(viewModel, signUpViewModel),
               // CustomBottomImagePickerSheet()
              ])));

  Widget _buildUiWidgets(UploadProfileImageViewModel viewModel,
          SignUpViewModel signUpViewModel) =>
      UploadProfileImageWidgets.buildUI(context, viewModel, signUpViewModel,
          imageButtonOnTap: () => viewModel.setBottomSheet(true),
          setAsProfileImageOnTap: () =>
              signUpViewModel.uploadProfileImage(context, viewModel, scaffoldKey));
}

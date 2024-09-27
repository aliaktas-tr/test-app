import 'package:new_weedus/export.dart';


mixin UploadProfileImageMixin on State<UploadProfileImageView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final picker = ImagePicker();
  bool loading = false;
  File? mediaUrl;

  void pageOnTapIfBottomSheetTrue(UploadProfileImageViewModel viewModel) {
    if (viewModel.openBottomSheet == true) {
      viewModel.setBottomSheet(false);
    } else {
      return;
    }
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
}

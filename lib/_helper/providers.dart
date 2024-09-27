import 'package:new_weedus/export.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AppState>(create: (_) => AppState()),
  ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
  ChangeNotifierProvider<ShopState>(create: (_) => ShopState()),
  ChangeNotifierProvider<CartState>(create: (_) => CartState()),
  ChangeNotifierProvider<CloseButtonCountDownState>(
      create: (_) => CloseButtonCountDownState()),
  ChangeNotifierProvider<LandingProductState>(
      create: (_) => LandingProductState()),
  ChangeNotifierProvider<LandingMainBannerViewModel>(
      create: (_) => LandingMainBannerViewModel()),
  ChangeNotifierProvider<ShopViewProductFilterViewModel>(
      create: (_) => ShopViewProductFilterViewModel()),
  ChangeNotifierProvider<CheckoutOrderViewModel>(
      create: (_) => CheckoutOrderViewModel()),
  ChangeNotifierProvider<OrderTrackingMapViewModel>(
      create: (_) => OrderTrackingMapViewModel()),
  ChangeNotifierProvider<SignInViewModel>(
      create: (_) => SignInViewModel()),
  ChangeNotifierProvider<SignUpViewModel>(
      create: (_) => SignUpViewModel()),
  ChangeNotifierProvider<AuthViewModel>(
      create: (_) => AuthViewModel()),
  ChangeNotifierProvider<PhoneAuthViewModel>(
      create: (_) => PhoneAuthViewModel()),
  ChangeNotifierProvider<UserViewModel>(
      create: (_) => UserViewModel()),
  ChangeNotifierProvider<UserSettingsViewModel>(
      create: (_) => UserSettingsViewModel()),
];

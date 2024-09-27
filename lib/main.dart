import 'package:new_weedus/export.dart';

final String _title = 'Weedus | Online Cannabis Store';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  usePathUrlStrategy();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        builder: (context, child) {
          return MaterialApp.router(
              title: _title,
              routerConfig: appRoutes,
              builder: FlutterSmartDialog.init(),
              theme: ThemeData(
                  scaffoldBackgroundColor: scaffoldBackgroundColor,
                  appBarTheme: AppBarTheme(color: scaffoldBackgroundColor)),
              scrollBehavior: MaterialScrollBehavior().copyWith(dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              }),
              debugShowCheckedModeBanner: false);
        });
  }
}

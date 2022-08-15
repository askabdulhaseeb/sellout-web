import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'providers/auction_provider.dart';
import 'providers/auth_state_provider.dart';
import 'providers/app_provider.dart';
import 'providers/message_page_provider.dart';
import 'providers/prod_provider.dart';
import 'providers/product_category_provider.dart';
import 'providers/user_provider.dart';
import 'route.dart';
import 'services/user_local_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await UserLocalData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color kPrimaryColor = Color(0xFFD32F2F);
    const Color kSecondaryColor = Color(0xFF7C4DFF);
    return MultiProvider(
      // ignore: always_specify_types
      providers: [
        ChangeNotifierProvider<AppProvider>.value(value: AppProvider()),
        ChangeNotifierProvider<AuctionProvider>.value(value: AuctionProvider()),
        ChangeNotifierProvider<AuthStateProvider>.value(
          value: AuthStateProvider(),
        ),
        ChangeNotifierProvider<MessagePageProvider>.value(
          value: MessagePageProvider(),
        ),
        ChangeNotifierProvider<ProdProvider>.value(value: ProdProvider()),
        ChangeNotifierProvider<ProdCatProvider>.value(value: ProdCatProvider()),
        ChangeNotifierProvider<UserProvider>.value(value: UserProvider()),
      ],
      child: MaterialApp.router(
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        title: 'Sellout Web',
        theme: ThemeData(
          dividerTheme: const DividerThemeData(thickness: 0.5, space: 0),
          appBarTheme: const AppBarTheme(
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          primaryColor: kPrimaryColor,
          colorScheme: const ColorScheme(
            primary: kPrimaryColor,
            secondary: kSecondaryColor,
            surface: Colors.white,
            background: Colors.white,
            error: Colors.red,
            onPrimary: Colors.red,
            onSecondary: Colors.deepPurple,
            onSurface: Colors.grey,
            onBackground: Colors.grey,
            onError: Colors.red,
            brightness: Brightness.light,
          ),
        ),
      ),
    );
  }
}

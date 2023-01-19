import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/auth-bloc.dart';
import 'package:deally/blocs/fournisseur-bloc.dart';
import 'package:deally/blocs/produits-bloc.dart';
import 'package:deally/screens/conexion-register/choice-conexion-register.dart';
import 'package:deally/screens/conexion-register/register.dart';
import 'package:deally/screens/home/brand-owner-screen.dart';
import 'package:deally/screens/home/brand-owner.dart';
import 'package:deally/screens/home/retailer-screen.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/screens/home/whole-seller-screen.dart';
import 'package:deally/screens/loading/loading.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/company/brand-owner/whole-sale/wholesale-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApplicationBloc()),
        ChangeNotifierProvider(create: (_) => UserBlock()),
        ChangeNotifierProvider(create: (_) => FournisseurBloc()),
        ChangeNotifierProvider(create: (_) => ProduitsBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deally',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: createMaterialColor(meuveFonce),
          fontFamily: 'Resolve_sans'),
      initialRoute: '/',
      routes: {
        '/choice-register': (context) => const ChoiceConexionRegister(),
        '/register': (context) => Register(),
        '/': (context) => FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("snapshot.data!.getString");
                print(snapshot.data!.getString("role"));
                if (snapshot.data!.getString('token') != "" &&
                    snapshot.data!.containsKey("token")) {
                  if (snapshot.data!.getString('role') == "commercant") {
                    return const HomeRetailer();
                  } else if (snapshot.data!.getString('role') ==
                      "fournisseur") {
                    return const BrandOwnerScreen();
                  } else if (snapshot.data!.getString('role') == "grossiste") {
                    return const WholeSellerScreen();
                  } else {
                    return const ChoiceConexionRegister();
                  }
                } else {
                  return const ChoiceConexionRegister();
                }
              } else {
                return const LoadingScreen();
              }
            }),
      },
    );
  }
}

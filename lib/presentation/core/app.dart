/*import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/presentation/costume/details/details_page.dart';
import 'package:digtial_costume_platform/presentation/costume/edit/edit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: Text(snapshot.error.toString()),
            ); //TODO: change this
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: CostumeEditPage(),
            );
          }
          return const MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: CostumeEditPage(),
          ); //TODO: change this
        });
  }
}

class CostumeDetail extends StatefulWidget {
  @override
  _CostumeDetailState createState() => _CostumeDetailState();
}

class _CostumeDetailState extends State<CostumeDetail> {
  Costume costume = Costume(
    id: "0",
    fashion: Fashion.mens,
    timeperiod: "1920",
    category: "Shirt",
    quantity: 1,
    colors: ["blue", "green"],
    themes: ['first theme', 'second theme', 'third theme', 'fourth', 'fifth'],
    productions: [
      Production(
          title: "first", startDate: DateTime.now(), endDate: DateTime.now()),
      Production(
          title: "second", startDate: DateTime.now(), endDate: DateTime.now()),
      Production(
          title: "third", startDate: DateTime.now(), endDate: DateTime.now())
    ],
    storageLocation: "Lille garderobe - 13",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.costumeDetailsFor('')),
          centerTitle: true,
        ),
        body: DetailsPage(
          costume: costume,
        ));
  }
}
 */

import 'package:digtial_costume_platform/application/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    //https://flutterigniter.com/dismiss-keyboard-form-lose-focus/
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
          }
        },
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => Locator().locator<AuthBloc>()
                  ..add(const AuthEvent.checkRequested()))
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.key,
            onGenerateRoute: _router.onGeneratedRoute,
          ),
        ));
  }
}

import 'package:digtial_costume_platform/bloc/auth/auth_bloc.dart';
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
          final FocusScopeNode currentFocus = FocusScope.of(context);

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

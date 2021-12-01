import 'package:crud_regmal/common/constants.dart';
import 'package:crud_regmal/pages/regmal_screen.dart';
import 'package:crud_regmal/provider/regmal_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegmalNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: kColorScheme,
          primaryColor: kOxfordWhite,
          primarySwatch: Colors.grey,
          appBarTheme: AppBarTheme(
            color: kRichWhite,
            iconTheme: IconThemeData(
              color: kDavysGrey,
            ),
          ),
          scaffoldBackgroundColor: kOxfordWhite,
          textTheme: kTextTheme,
          backgroundColor: kOxfordWhite,
          // brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: kDavysGrey,
          ),
        ),
        home: RegmalSatuScreen(),
      ),
    );
  }
}

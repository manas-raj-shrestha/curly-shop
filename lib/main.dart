import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_test/core/theme/app_theme_provider.dart';
import 'package:unit_test/core/theme/app_themes.dart';
import 'package:unit_test/ui/product_list_view.dart';

import 'core/helper/dependency_injection.dart';

void main() {
  setUpInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppThemeProvider>.value(
      value: injector<AppThemeProvider>(),
      builder: (ctx, widget) {
        return Consumer<AppThemeProvider>(builder: (ctx, appThemeProvider, _) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: appThemeProvider.currentTheme,
              // ignore: prefer_const_constructors
              home: ProductListView());
        });
      },
    );
  }
}

import 'package:color_pallate_generator_app/providers/pallate_provider.dart';
import 'package:color_pallate_generator_app/views/home_screen/page/home_screen.dart';
import 'package:provider/provider.dart';
import '/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'providers/app_theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PaletteProvider>(
          create: (context) => PaletteProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder:(context,_) => MaterialApp(
        themeMode: (Provider.of<ThemeProvider>(context).obj.isDark) ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.black.withOpacity(0.7),
          dialogBackgroundColor: const Color(0XFF88CCCC),
          secondaryHeaderColor: Colors.black,
          cardColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.white,
          useMaterial3: true,
          dialogBackgroundColor: const Color(0XFF121212),
          secondaryHeaderColor: Colors.white,
          cardColor: Colors.grey.withOpacity(0.6),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes().colorPellet,
        routes: routes,
      ),
    );
  }
}
Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().colorPellet: (context) => const ColorPellets(),
};

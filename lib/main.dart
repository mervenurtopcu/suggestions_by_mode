import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_based_suggestions/product/app_states/index.dart';
import 'package:mood_based_suggestions/product/constants/index.dart';
import 'package:mood_based_suggestions/product/theme/index.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: StringConstants.materialAppTitle,
      debugShowCheckedModeBanner: false,
       theme: ref.watch(settingsProvider).isDarkTheme ? DarkTheme.darkTheme :LightTheme.lightTheme,
      home:const BottomNavBar(),
    );
  }
}


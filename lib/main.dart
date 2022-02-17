import 'package:clean_architecture_flutter/src/config/app_routes.dart';
import 'package:clean_architecture_flutter/src/config/app_theme.dart';
import 'package:clean_architecture_flutter/src/core/constants.dart';
import 'package:clean_architecture_flutter/src/injector.dart';
import 'package:clean_architecture_flutter/src/presentation/blocs/remote_articles/remote_articles_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (_) => injector()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
      ),
    );
  }
}

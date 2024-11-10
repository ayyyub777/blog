import 'package:blog/config/theme/app_theme.dart';
import 'package:blog/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:blog/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:blog/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:blog/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) {
        final bloc = sl<RemoteArticlesBloc>();
        bloc.add(const GetArticles());
        return bloc;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}

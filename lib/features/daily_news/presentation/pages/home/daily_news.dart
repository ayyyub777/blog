import 'package:blog/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:blog/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:blog/features/daily_news/presentation/widgets/article_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
              );
            },
            itemCount: state.articles!.length,
          );
        } else if (state is RemoteArticlesError) {
          return Center(
            child: Icon(Icons.refresh),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

import "package:blog/core/resources/data_state.dart";
import "package:blog/features/daily_news/domain/usecases/get_article.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:blog/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart";
import "package:blog/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart";

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    emit(const RemoteArticlesLoading());
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(articles: dataState.data!));
    } else if (dataState is DataError) {
      emit(RemoteArticlesError(error: dataState.error!));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/feature/shownews/domain/entitles/news_info.dart';
import 'package:newsapp/feature/shownews/domain/usecases/fetch_news.dart';

import '../../../../core/failure_successes/failures.dart';
import '../../../../core/service_locator.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial(news: const []));

  final FetchNewsUsecase _fetchNewsUsecase = sl<FetchNewsUsecase>();

  void fetchNews(String? searchText) async {
    emit(NewsLoading());

    final Either<Failure, List<NewsInfo>> fetchNewsResults =
        await _fetchNewsUsecase.fetchNews(searchText);
    fetchNewsResults.fold((l) {
      emit(NewsError());
    }, (news) {
      if (searchText != null) {
        emit(NewsInitial(news: news));
      } else {
        emit(NewsInitialSearch(news: news));
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/feature/shownews/presentation/cubit/news_cubit.dart';
import '../../../../core/constants/palette.dart';
import 'components/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().fetchNews(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        title: const Text(
          'News',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Palette.deepBlue),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onSubmitted: (searchText) {
              if (searchText.trim() == '') {
                context.read<NewsCubit>().fetchNews(null);
              } else {
                context.read<NewsCubit>().fetchNews(searchText);
              }
            },
            style: const TextStyle(fontSize: 14, color: Palette.deepBlue),
            cursorColor: Palette.deepBlue,
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: Palette.lightgrey,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Palette.lightgrey,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Palette.lightgrey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Palette.deepBlue))),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
            if (state is NewsInitial) {
              return const Text(
                'Top News',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Palette.deepBlue),
              );
            } else if (state is NewsInitialSearch) {
              return const Text(
                'Search News',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Palette.deepBlue),
              );
            } else {
              return const SizedBox();
            }
          }),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: ((context, state) {
                if (state is NewsInitial) {
                  return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          newsInfo: state.news[index],
                        );
                      });
                } else if (state is NewsInitialSearch) {
                  return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          newsInfo: state.news[index],
                        );
                      });
                } else if (state is NewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Palette.deepBlue,
                    ),
                  );
                } else {
                  return Center(
                    child: IconButton(
                      onPressed: (){
                        context.read<NewsCubit>().fetchNews(null);
                      }, 
                    icon: const Icon(Icons.replay, color: Palette.deepBlue, size: 24,)),
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

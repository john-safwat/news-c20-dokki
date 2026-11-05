import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c20_dokki/core/base/base_state.dart';
import 'package:news_c20_dokki/core/di/di.dart';
import 'package:news_c20_dokki/core/utils/context_extention.dart';
import 'package:news_c20_dokki/core/utils/numbers_extension.dart';
import 'package:news_c20_dokki/core/utils/widget_extension.dart';
import 'package:news_c20_dokki/domain/entity/news_category.dart';
import 'package:news_c20_dokki/presentation/home/tabs/news/news_actions.dart';
import 'package:news_c20_dokki/presentation/home/tabs/news/news_logic.dart';
import 'package:news_c20_dokki/presentation/home/tabs/news/news_state.dart';
import 'package:news_c20_dokki/presentation/home/widgets/article_card.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  final NewsCategory category;

  NewsTab({required this.category, super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  final cubit = get<NewsCubit>();

  @override
  void initState() {
    super.initState();
    cubit.doAction(LoadSourcesNewsAction(widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state.sourcesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.sourcesError != null) {
            return Center(child: Text(state.sourcesError!));
          } else {
            return Column(
              children: [
                DefaultTabController(
                  length: state.sources.length,
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    dividerHeight: 0,
                    onTap: (index) {
                      cubit.doAction(ChangeIndexNewsAction(index));
                    },
                    tabs: state.sources
                        .map(
                          (e) => Text(
                            e.name,
                            style: context.text.labelLarge,
                          ).allPadding(16),
                        )
                        .toList(),
                  ),
                ),
                16.verticalSpace,
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, _) {
                      if (state.articlesLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state.articlesError != null) {
                        return Center(
                          child: Text(state.articlesError.toString()),
                        );
                      } else {
                        return ListView.separated(
                          padding: EdgeInsets.all(16),
                          separatorBuilder: (_, _) => 16.verticalSpace,
                          itemCount: state.articles.length,
                          itemBuilder: (context, index) =>
                              ArticleCard(article: state.articles[index]),
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

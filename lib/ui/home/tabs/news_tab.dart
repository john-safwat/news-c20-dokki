import 'package:flutter/material.dart';
import 'package:news_c20_dokki/api/api_manger.dart';
import 'package:news_c20_dokki/core/utils/context_extention.dart';
import 'package:news_c20_dokki/core/utils/numbers_extension.dart';
import 'package:news_c20_dokki/core/utils/widget_extension.dart';
import 'package:news_c20_dokki/models/articles_response.dart' hide Source;
import 'package:news_c20_dokki/models/news_category.dart';
import 'package:news_c20_dokki/models/sources_response.dart';
import 'package:news_c20_dokki/ui/home/widgets/article_card.dart';

class NewsTab extends StatelessWidget {
  final NewsCategory category;

  final ApiManger apiManger = ApiManger();

  NewsTab({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: apiManger.getSources(category.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == .waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          if (snapshot.data?.message != null) {
            return Center(child: Text(snapshot.data!.message!));
          } else {
            var sources = snapshot.data?.sources ?? [];
            return NewsLayout(sources);
          }
        }
      },
    );
  }
}

class NewsLayout extends StatefulWidget {
  final List<Source> sources;

  const NewsLayout(this.sources);

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerHeight: 0,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sources
                .map(
                  (e) => Text(
                    e.name ?? "",
                    style: context.text.labelLarge,
                  ).allPadding(16),
                )
                .toList(),
          ),
        ),
        16.verticalSpace,
        Expanded(
          child: FutureBuilder<ArticlesResponse>(
            future: ApiManger().getArticles(
              widget.sources[selectedIndex].id ?? "",
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == .waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                if (snapshot.data?.message != null) {
                  return Center(child: Text(snapshot.data!.message!));
                } else {
                  var articles = snapshot.data?.articles ?? [];
                  return ListView.separated(
                    padding: EdgeInsets.all(16),
                    separatorBuilder: (_, _)=>16.verticalSpace,
                    itemCount: articles.length,
                    itemBuilder: (context, index) => ArticleCard(article: articles[index]),
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}

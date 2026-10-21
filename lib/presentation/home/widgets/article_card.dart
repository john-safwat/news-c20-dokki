import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c20_dokki/core/providers/app_config_provider.dart';
import 'package:news_c20_dokki/core/utils/context_extention.dart';
import 'package:news_c20_dokki/core/utils/widget_extension.dart';
import 'package:news_c20_dokki/domain/entity/article_entity.dart';
import 'package:provider/provider.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntity article;

  const ArticleCard({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(width: 1, color: context.colors.primary),
      ),
      child: Column(
        mainAxisAlignment: .start,
        spacing: 16,
        children: [
          CachedNetworkImage(
            imageUrl: article.image,
            placeholder: (_, _) => Image.asset(
              "assets/images/news_logo_${provider.isDarkMode ? "dark" : "light"}.png",
            ),
            errorWidget: (_, __, ___) => Image.asset(
              "assets/images/news_logo_${provider.isDarkMode ? "dark" : "light"}.png",
            ),
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            imageBuilder: (_, imageProvider) => Image(image: imageProvider , fit: .cover,).clip(16)
          ),
          Text(article.title, style: context.text.labelLarge),
          Row(
            children: [
              Expanded(
                child: Text(
                  article.author,
                  style: context.text.labelSmall,
                ),
              ),
              Text(article.publishedAt, style: context.text.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}

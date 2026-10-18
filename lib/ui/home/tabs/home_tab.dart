import 'package:flutter/material.dart';
import 'package:news_c20_dokki/core/providers/app_config_provider.dart';
import 'package:news_c20_dokki/core/utils/context_extention.dart';
import 'package:news_c20_dokki/core/utils/numbers_extension.dart';
import 'package:news_c20_dokki/core/utils/widget_extension.dart';
import 'package:news_c20_dokki/models/news_category.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  final void Function(NewsCategory) onClick;

  const HomeTab({required this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var categories = NewsCategory.getCategories(isDark: provider.isDarkMode);
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        SafeArea(
          top: true,
          bottom: false,
          child: Text(
            "Good Morning\nHere is Some News For You",
            style: context.text.titleLarge,
          ),
        ),
        16.verticalSpace,
        for (int i = 0; i < categories.length; i++)
          _buildCategoryCard(categories[i], i, context , onClick),
      ],
    );
  }

  Widget _buildCategoryCard(
    NewsCategory category,
    int index,
    BuildContext context,
    void Function(NewsCategory) onClick,
  ) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            onClick(category);
          },
          child: Stack(
            alignment: index % 2 != 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            children: [
              Image.asset(category.categoryImage).clip(24),
              Column(
                crossAxisAlignment: index % 2 != 0 ? .start : .end,
                children: [
                  Text(
                    category.categoryName,
                    style: context.text.titleLarge!.copyWith(
                      color: context.colors.surface,
                      fontSize: 32,
                    ),
                  ),
                  32.verticalSpace,
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.4,
                    ),
                    decoration: BoxDecoration(
                      color: context.colors.surface.withAlpha(80),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        if (index % 2 != 0)
                          Container(
                            decoration: BoxDecoration(
                              color: context.colors.surface,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(18),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: context.colors.primary,
                            ),
                          ),
                        Expanded(
                          child: Text(
                            "View All",
                            style: context.text.titleLarge,
                            textAlign: .center,
                          ).allPadding(16),
                        ),
                        if (index % 2 == 0)
                          Container(
                            decoration: BoxDecoration(
                              color: context.colors.surface,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(18),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: context.colors.primary,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ).allPadding(16),
            ],
          ),
        ),
        16.verticalSpace,
      ],
    );
  }
}

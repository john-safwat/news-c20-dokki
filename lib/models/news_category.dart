class NewsCategory {
  final String categoryName;
  final String categoryImage;
  final String categoryId;

  const NewsCategory({
    required this.categoryName,
    required this.categoryImage,
    required this.categoryId,
  });

  /// Returns the categories list dynamically configured for light or dark mode.
  static List<NewsCategory> getCategories({bool isDark = false}) {
    final themeFolder = isDark ? 'dark' : 'light';

    return [
      NewsCategory(
        categoryId: 'general',
        categoryName: 'General',
        categoryImage: 'assets/images/$themeFolder/general.png',
      ),
      NewsCategory(
        categoryId: 'business',
        categoryName: 'Business',
        categoryImage:
            'assets/images/$themeFolder/busniess.png', // matches asset spelling
      ),
      NewsCategory(
        categoryId: 'sports',
        categoryName: 'Sports',
        categoryImage:
            'assets/images/$themeFolder/sport.png', // matches asset spelling
      ),
      NewsCategory(
        categoryId: 'technology',
        categoryName: 'Technology',
        categoryImage: 'assets/images/$themeFolder/technology.png',
      ),
      NewsCategory(
        categoryId: 'entertainment',
        categoryName: 'Entertainment',
        categoryImage: 'assets/images/$themeFolder/entertainment.png',
      ),

      NewsCategory(
        categoryId: 'health',
        categoryName: 'Health',
        categoryImage:
            'assets/images/$themeFolder/helth.png', // matches asset spelling
      ),
      NewsCategory(
        categoryId: 'science',
        categoryName: 'Science',
        categoryImage: 'assets/images/$themeFolder/science.png',
      ),
    ];
  }
}

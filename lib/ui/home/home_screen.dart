import 'package:flutter/material.dart';
import 'package:news_c20_dokki/core/providers/app_config_provider.dart';
import 'package:news_c20_dokki/core/utils/context_extention.dart';
import 'package:news_c20_dokki/core/utils/numbers_extension.dart';
import 'package:news_c20_dokki/core/utils/widget_extension.dart';
import 'package:news_c20_dokki/models/news_category.dart';
import 'package:news_c20_dokki/ui/home/tabs/home_tab.dart';
import 'package:news_c20_dokki/ui/home/tabs/news_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? "Home" : selectedCategory!.categoryName,
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: _drawer(provider),
      body: selectedCategory == null
          ? HomeTab(onClick: changeCategory)
          : NewsTab(category: selectedCategory!),
    );
  }

  void changeCategory(NewsCategory category) {
    selectedCategory = category;
    setState(() {});
  }

  Widget _drawer(AppConfigProvider provider) {
    return Drawer(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: double.infinity,
            height: 240,
            alignment: .center,
            decoration: BoxDecoration(color: context.colors.primary),
            child: Text(
              "News App",
              style: context.text.titleLarge!.copyWith(
                color: context.colors.surface,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              selectedCategory = null;
              setState(() {});
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(Icons.home, size: 32),
                16.horizontalSpace,
                Text("Go to Home", style: context.text.titleLarge!),
              ],
            ).allPadding(16),
          ),
          Divider(),
          Text("Theme", style: context.text.titleLarge).symmetricPadding(8, 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(width: 1 , color: context.colors.primary),
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButton<ThemeMode>(
              items: [
                DropdownMenuItem(value: ThemeMode.light, child: Text("Light")),
                DropdownMenuItem(value: ThemeMode.dark, child: Text("Dark")),
              ],
              isExpanded: true,
              borderRadius: BorderRadius.circular(16),
              underline: SizedBox(),
              value: provider.themeMode,
              onChanged: (mode) {
                provider.changeTheme(mode!);
              },
            ),
          ),
          16.verticalSpace,
          Divider(),
          Text("Language", style: context.text.titleLarge).symmetricPadding(8, 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(width: 1 , color: context.colors.primary),
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButton<String>(
              items: [
                DropdownMenuItem(value: "en", child: Text("English")),
              ],
              isExpanded: true,
              borderRadius: BorderRadius.circular(16),
              underline: SizedBox(),
              value: "en",
              onChanged: (mode) {
                // todo add arabic support
              },
            ),
          ),
        ],
      ),
    );
  }
}

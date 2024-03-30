import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/sample_feature/news_card_item.dart';
import 'package:news/src/sample_feature/skleton_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/bloc/get_api_bloc.dart';
import '../../core/models/article.dart';
import '../settings/settings_controller.dart';
import '../settings/settings_view.dart';

// ignore: must_be_immutable
/// Displays a list of SampleItems.
class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
    required this.controller,
  });
  SettingsController controller;
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articleList = [];
  bool _isSearchVisible = false;

  @override
  void initState() {
    context.read<GetApiBloc>().add(FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              if (_isSearchVisible == true) {
                context.read<GetApiBloc>().add(FetchData());
              }
              setState(() {
                _isSearchVisible = !_isSearchVisible;
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DrawerHeader(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/news.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                  const Positioned(
                    right: 25,
                    bottom: 63,
                    child: Text(
                      "NEWS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 7,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(0),
                      children: [
                        ListTile(
                          title: const Text("Business"),
                          onTap: () {
                            if (_isSearchVisible) {
                              setState(() {
                                _isSearchVisible = false;
                              });
                            }
                            context
                                .read<GetApiBloc>()
                                .add(FetchCategory("business"));
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("Entertainment"),
                          onTap: () {
                            if (_isSearchVisible) {
                              setState(() {
                                _isSearchVisible = false;
                              });
                            }
                            context
                                .read<GetApiBloc>()
                                .add(FetchCategory("entertainment"));
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("General"),
                          onTap: () {
                            if (_isSearchVisible) {
                              setState(() {
                                _isSearchVisible = false;
                              });
                            }
                            context
                                .read<GetApiBloc>()
                                .add(FetchCategory("general"));
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("Health"),
                          onTap: () {
                            if (_isSearchVisible) {
                              setState(() {
                                _isSearchVisible = false;
                              });
                            }
                            context
                                .read<GetApiBloc>()
                                .add(FetchCategory("health"));
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("Science"),
                          onTap: () {
                            if (_isSearchVisible) {
                              setState(() {
                                _isSearchVisible = false;
                              });
                            }
                            context
                                .read<GetApiBloc>()
                                .add(FetchCategory("science"));
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("Sports"),
                          onTap: () {
                            if (_isSearchVisible) {
                              setState(() {
                                _isSearchVisible = false;
                              });
                            }
                            context
                                .read<GetApiBloc>()
                                .add(FetchCategory("sports"));
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("Technology"),
                          onTap: () {
                            if (_isSearchVisible) {
                              setState(() {
                                _isSearchVisible = false;
                              });
                            }

                            context
                                .read<GetApiBloc>()
                                .add(FetchCategory("technology"));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(right: 8),
                    trailing: IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child:
                                    SettingsView(controller: widget.controller),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Visibility(
              visible: _isSearchVisible,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, top: 8, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: isDarkMode == true
                          ? const Color.fromARGB(255, 40, 37, 45)
                          : const Color.fromARGB(255, 243, 237, 246),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(22))),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Search..",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            bottom: 8, top: 8, left: 20, right: 20)),
                    onFieldSubmitted: (value) {
                      if (value.isEmpty) {
                        context.read<GetApiBloc>().add(FetchData());

                        return;
                      }
                      context.read<GetApiBloc>().add(Search(value));
                    },
                  ),
                ),
              )),
          Expanded(
            child: BlocBuilder<GetApiBloc, DataState>(
              builder: (context, state) {
                if (state is DataLoading) {
                  return const SkeletonWidget();
                } else if (state is DataLoaded) {
                  var listArticle = state.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listArticle.length,
                    itemBuilder: (context, index) {
                      var article = listArticle[index];
                      print(article.urlToImage);
                      bool isRemoved = article.title == "[Removed]";
                      /* if (article.urlToImage == null) {
                          return const Center();
                        } */
                      return NewCardItem(
                        article: article,
                        isRemoved: isRemoved,
                      );
                    },
                  );
                } else if (state is DataEmpty) {
                  return const Center(
                    child:
                        Text("Aradağınız konu hakkında bir haber bulunamadı."),
                  );
                } else if (state is DataError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return const Center();
              },
            ),
          )
        ],
      ),
    );
  }
}

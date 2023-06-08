import 'package:action_figure_app_ui/consts.dart';
import 'package:action_figure_app_ui/models/action_figure_model.dart';
import 'package:action_figure_app_ui/models/category_model.dart';
import 'package:action_figure_app_ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:action_figure_app_ui/widgets/app_bar_button.dart';
import 'package:action_figure_app_ui/widgets/category_item.dart';
import 'package:action_figure_app_ui/widgets/figure_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedCategory = 0;
  int currentMenu = 0;
  List<ActionFigureModel> datas = actionModel
      .where((element) => element.category.contains(categories[0].category))
      .toList();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leadingWidth: 75,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(
          children: const [
            SizedBox(width: 30),
            AppBarButton(
              icon: Icons.menu_rounded,
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              const AppBarButton(icon: Icons.search),
              const SizedBox(width: 10),
              Stack(
                children: [
                  const AppBarButton(icon: Icons.shopping_cart_outlined),
                  Positioned(
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Text(
                        '3',
                        style: poppins.copyWith(color: white, fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 30),
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RichText(
                text: TextSpan(
                    style: poppins.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: black),
                    children: const [
                  TextSpan(text: 'Find Your Favorite\nAction Figure'),
                  WidgetSpan(child: SizedBox(width: 10)),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                        size: 28,
                      ))
                ])),
          ),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                    categories.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(left: 30, right: 12)
                              : index == categories.length - 1
                                  ? const EdgeInsets.only(right: 30)
                                  : const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = index;

                                datas = actionModel
                                    .where((element) => element.category
                                        .contains(categories[index].category))
                                    .toList();
                                scrollController.animateTo(0.0,
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeIn);
                              });
                            },
                            child: CategoryItem(
                              category: categories[index],
                              selected: selectedCategory == index,
                            ),
                          ),
                        ))
              ],
            ),
          ),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            padding: const EdgeInsets.only(bottom: 10),
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  datas.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 30)
                        : index == datas.length - 1
                            ? const EdgeInsets.only(right: 30, left: 20)
                            : const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return child;
                              },
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return DetailPage(
                                  figure: datas[index],
                                );
                              },
                            ));
                      },
                      child: FigureItem(
                        figure: datas[index],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: green,
          unselectedItemColor: black.withOpacity(0.7),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentMenu,
          onTap: (value) {
            setState(() {
              currentMenu = value;
            });
          },
          backgroundColor: white,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded), label: ''),
            BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    const Icon(Icons.notifications_rounded),
                    Positioned(
                      right: 5,
                      child: Container(
                        width: 7.5,
                        height: 7.5,
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      ),
                    )
                  ],
                ),
                label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: ''),
          ]),
    );
  }
}

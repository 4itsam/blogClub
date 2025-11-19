import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfile/caruser/carousel_slider.dart';
import 'package:myfile/data.dart';
import 'package:myfile/gen/assets.gen.dart';
import 'package:myfile/gen/fonts.gen.dart';
import 'package:myfile/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: scaffoldBG,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi Johnatan",
                      style: themeData.textTheme.headlineMedium,
                    ),
                    Assets.img.icons.notification.image(scale: 4.5),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 7, 32, 20),
                child: Text(
                  "Explore Today",
                  style: themeData.textTheme.headlineLarge,
                ),
              ),
              StoryList(),
              MySlider(),
              PostList(),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class MySlider extends StatelessWidget {
  const MySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: CategoryDataBase.categories.length,
        itemBuilder: (context, index, realIndex) {
          final category = CategoryDataBase.categories[index];
          return CategoryItem(
            category: category,
            index: index,
            start: realIndex == 0 ? 20 : 0,
            end: realIndex == CategoryDataBase.categories.length - 1 ? 20 : 0,
          );
        },
        options: CarouselOptions(
          viewportFraction: 0.8,
          aspectRatio: 1.1,
          scrollDirection: Axis.horizontal,
          initialPage: 0,
          scrollPhysics: BouncingScrollPhysics(),
          enlargeCenterPage: true,
          disableCenter: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key,
    required this.category,
    required this.index,
    required this.start,
    required this.end,
  });

  final Category category;
  final int index;
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 8, left: start, bottom: 5, right: end),
      child: Stack(
        children: [
          Positioned.fill(
            top: 200,
            right: 70,
            left: 60,
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 20,
                    color: Color.fromARGB(255, 7, 20, 32),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(8.0),

              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(0, 255, 0, 0),
                    Color.fromARGB(0, 255, 0, 0),
                    Color.fromARGB(115, 34, 34, 34),
                    Color.fromARGB(255, 34, 34, 34),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12)],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/img/posts/large/${category.imageFileName}",
                  ),
                ),
                color: Colors.amber,
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),

          Positioned(
            left: 45,
            bottom: 42,
            child: Text(
              CategoryDataBase.categories[index].title,
              style: themeData.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class StoryList extends StatelessWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: AppDatabace.storeis.length,
        itemBuilder: (context, index) {
          final story = AppDatabace.storeis[index];
          return UserStory(story: story, index: index);
        },
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  const UserStory({super.key, required this.story, required this.index});

  final StoryData story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(index == 0 ? 20 : 0, 0, 0, 0),
      child: Column(
        spacing: 4,
        children: [
          Stack(
            children: [
              story.isVeiwed == true
                  ? profileImageViewed()
                  : profileImageNormal(),

              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  height: 30,
                  "assets/img/icons/${story.iconFileName}",
                ),
              ),
            ],
          ),
          Text(story.name),
        ],
      ),
    );
  }

  Container profileImageNormal() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [Color(0xff376AED), Color(0xff49B0E2), Color(0xff9CECFB)],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: _profile(),
      ),
    );
  }

  Widget profileImageViewed() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          padding: EdgeInsets.all(2),
          color: Color(0xff7B8BB2),
          strokeWidth: 1.5,
          borderPadding: EdgeInsets.all(2),
          dashPattern: [10, 6],
          radius: Radius.circular(28),
        ),
        child: _profile(),
      ),
    );
  }

  Widget _profile() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(24),
        child: Image.asset(
          "assets/img/stories/${story.imageFileName}",
          height: 68,
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = PostDatabase.postData;
    final ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Latest News", style: themeData.textTheme.displayLarge),
              TextButton(
                child: Text("More", style: themeData.textTheme.bodySmall),
                onPressed: () {},
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: posts.length,
          itemExtent: 141,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final post = posts[index];
            return Container(
              margin: EdgeInsets.all(10),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                spacing: 10,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: Image.asset(
                      "assets/img/posts/small/${post.imageFileName}",
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          post.title,
                          style: TextStyle(
                            fontFamily: FontFamily.avenir,
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          post.caption,
                          style: TextStyle(
                            fontFamily: FontFamily.avenir,
                            fontSize: 16,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              CupertinoIcons.hand_thumbsup,
                              size: 20,
                              color: secondaryTextColor,
                            ),
                            SizedBox(width: 4),
                            Text(
                              post.likes,
                              style: TextStyle(
                                fontFamily: FontFamily.avenir,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 15),
                            Icon(
                              CupertinoIcons.clock,
                              size: 20,
                              color: secondaryTextColor,
                            ),
                            SizedBox(width: 4),
                            Text(post.time),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  post.isBookMarked
                                      ? CupertinoIcons.bookmark_fill
                                      : CupertinoIcons.bookmark,
                                  size: 20,
                                  color: secondaryTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

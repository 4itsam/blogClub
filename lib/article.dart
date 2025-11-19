import 'package:flutter/material.dart';
import 'package:myfile/gen/assets.gen.dart';
import 'package:myfile/main.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: scaffoldBG,

      floatingActionButton: InkWell(
        onTap: () =>
            showSnackBar(message: "like button clicked", context: context),
        child: Container(
          width: 111,
          height: 48,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(blurRadius: 20, color: primaryColor.withAlpha(180)),
            ],
          ),
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              Text(
                "2.1k",
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),

      body: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Text("Article"),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz_rounded),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Text(
                      "Four Things Every Woman Needs To Know",
                      style: themeData.textTheme.bodyLarge!.apply(
                        color: primaryTextColor,
                        fontSizeDelta: 6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 32,
                      right: 32,
                      bottom: 32,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          child: Assets.img.stories.story1.image(
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Richard Geman",
                                style: themeData.textTheme.bodyLarge!.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text("2m ago"),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showSnackBar(
                              message: "share button is clicked",
                              context: context,
                            );
                          },
                          icon: Assets.img.icons.send.svg(
                            height: 28,
                            width: 28,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showSnackBar(
                              message: "Bookmark button is clicked",
                              context: context,
                            );
                          },
                          icon: Assets.img.icons.bookmark.svg(
                            height: 28,
                            width: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadiusGeometry.vertical(
                      top: Radius.circular(24),
                    ),
                    child: Assets.img.background.singlePost.image(
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text(
                      "A man’s sexuality is never your mind responsibility.",
                      style: themeData.textTheme.headlineLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 100),
                    child: Text(
                      "This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.\n\nThis one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.\n\nThis one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.",
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(0, 255, 255, 255),
                    Colors.white,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

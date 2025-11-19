import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfile/data.dart';
import 'package:myfile/gen/assets.gen.dart';
import 'package:myfile/gen/fonts.gen.dart';
import 'package:myfile/main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = PostDatabase.postData;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: themeData.textTheme.bodyLarge!.copyWith(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: SizedBox(
                height: 314,

                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,

                            color: themeData.colorScheme.onSurface.withAlpha(
                              10,
                            ),
                            offset: Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 20,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                  child: Assets.img.stories.story4.image(
                                    height: 84,
                                    width: 84,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    spacing: 4,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("@joviedan"),
                                      Text(
                                        "Jovi Daniel",
                                        style: themeData.textTheme.bodyLarge!
                                            .copyWith(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                      Text(
                                        "UX Designer",
                                        style: themeData.textTheme.bodySmall!
                                            .copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Text(
                              "About ME",
                              style: themeData.textTheme.bodyLarge!.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Madison Blackstone is a director of user experience design, with experience managing global teams.",
                              style: themeData.textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 80,
                      left: 80,
                      child: Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(199, 68, 68, 68),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 32,
                      left: 32,
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 45, 86, 190),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "52",
                                      style: themeData.textTheme.bodyLarge!
                                          .apply(fontSizeDelta: -3),
                                    ),
                                    Text(
                                      "Post",
                                      style: themeData.textTheme.bodyMedium!
                                          .copyWith(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "250",
                                    style: themeData.textTheme.bodyLarge!.apply(
                                      fontSizeDelta: -3,
                                    ),
                                  ),
                                  Text(
                                    "Following",
                                    style: themeData.textTheme.bodyMedium!
                                        .copyWith(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "4.5k",
                                    style: themeData.textTheme.bodyLarge!.apply(
                                      fontSizeDelta: -3,
                                    ),
                                  ),
                                  Text(
                                    "Followers",
                                    style: themeData.textTheme.bodyMedium!
                                        .copyWith(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: themeData.colorScheme.onPrimary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: themeData.colorScheme.onSurface.withAlpha(10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 32, 40, 32),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "My Posts",
                            style: themeData.textTheme.bodyLarge!.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.grid.svg(
                            height: 28,
                            width: 28,
                            fit: BoxFit.cover,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.table.svg(
                            height: 28,
                            width: 28,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

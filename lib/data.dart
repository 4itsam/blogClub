class StoryData {
  final int id;
  final String name;
  final String imageFileName;
  final String iconFileName;
  final bool isVeiwed;

  StoryData({
    required this.id,
    required this.name,
    required this.imageFileName,
    required this.iconFileName,
    required this.isVeiwed,
  });
}

class Category {
  final int id;
  final String title;
  final String imageFileName;
  Category({
    required this.id,
    required this.title,
    required this.imageFileName,
  });
}

class PostData {
  final int id;
  final String title;
  final String caption;
  final String likes;
  final String time;
  final bool isBookMarked;
  final String imageFileName;
  PostData({
    required this.id,
    required this.title,
    required this.caption,
    required this.likes,
    required this.time,
    required this.isBookMarked,
    required this.imageFileName,
  });
}

class AppDatabace {
  static List<StoryData> get storeis {
    return [
      StoryData(
        id: 1,
        name: "Emilia",
        imageFileName: "story_1.jpg",
        iconFileName: "category_1.png",
        isVeiwed: false,
      ),
      StoryData(
        id: 2,
        name: "Richard",
        imageFileName: "story_2.jpg",
        iconFileName: "category_2.png",
        isVeiwed: false,
      ),
      StoryData(
        id: 3,
        name: "Jasamin",
        imageFileName: "story_3.jpg",
        iconFileName: "category_3.png",
        isVeiwed: true,
      ),
      StoryData(
        id: 4,
        name: "Lucas",
        imageFileName: "story_4.jpg",
        iconFileName: "category_4.png",
        isVeiwed: true,
      ),
      StoryData(
        id: 5,
        name: "Jasamin",
        imageFileName: "story_5.jpg",
        iconFileName: "category_2.png",
        isVeiwed: false,
      ),
      StoryData(
        id: 6,
        name: "Hendri",
        imageFileName: "story_6.jpg",
        iconFileName: "category_4.png",
        isVeiwed: false,
      ),
      StoryData(
        id: 7,
        name: "Hendri",
        imageFileName: "story_7.jpg",
        iconFileName: "category_1.png",
        isVeiwed: false,
      ),
      StoryData(
        id: 8,
        name: "Hendri",
        imageFileName: "story_8.jpg",
        iconFileName: "category_2.png",
        isVeiwed: false,
      ),
    ];
  }
}

class CategoryDataBase {
  static List<Category> get categories {
    return [
      Category(id: 1, title: "Technology", imageFileName: "large_post_1.jpg"),
      Category(id: 2, title: "Story", imageFileName: "large_post_2.jpg"),
      Category(id: 3, title: "Adventure", imageFileName: "large_post_3.jpg"),
      Category(id: 4, title: "Scince", imageFileName: "large_post_4.jpg"),
      Category(id: 5, title: "travel", imageFileName: "large_post_5.jpg"),
      Category(id: 6, title: "travel", imageFileName: "large_post_6.jpg"),
    ];
  }
}

class PostDatabase {
  static List<PostData> get postData {
    return [
      PostData(
        id: 1,
        title: "Change OS",
        caption: "devs are gonna switch to mac!",
        likes: "1.2k",
        time: "1 hr ago",
        isBookMarked: true,
        imageFileName: "small_post_1.jpg",
      ),
      PostData(
        id: 2,
        title: "Automobiles",
        caption: "ride faster & faster until finish the road",
        likes: "2.2k",
        time: "2 hr ago",
        isBookMarked: false,
        imageFileName: "small_post_2.jpg",
      ),
      PostData(
        id: 3,
        title: "Automobiles",
        caption: "ride faster & faster until finish the road",
        likes: "1.2k",
        time: "3 hr ago",
        isBookMarked: false,
        imageFileName: "small_post_3.jpg",
      ),
      PostData(
        id: 4,
        title: "Age of AI",
        caption: "use your assistance in your phone",
        likes: "4.2k",
        time: "4 hr ago",
        isBookMarked: true,
        imageFileName: "small_post_4.jpg",
      ),
    ];
  }
}

class OnBordingItem {
  final String title;
  final String description;
  OnBordingItem({required this.title, required this.description});
}

class OnBordingDatabase {
  static List<OnBordingItem> get onBordingItem {
    return [
      OnBordingItem(
        title: "Read the article you want instantly",
        description:
            "You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.",
      ),
      OnBordingItem(
        title: "Stay organised with smart tools",
        description:
            "Manage your tasks easily, track your progress, and keep everything in one place so you can focus on what really matters.",
      ),
      OnBordingItem(
        title: "Access your content anywhere",
        description:
            "Sync your data across devices and enjoy a smooth experience whether you're at home, at work, or on the go.",
      ),
      OnBordingItem(
        title: "Personalise your workflow",
        description:
            "Customise the app to your style — adjust themes, set preferences, and create an experience that fits you perfectly.",
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import '../../data/API/firebase_fooder_api.dart';
import '../../data/models/explore_data.dart';
import '../widgets/friend_post_list_view.dart';
import '../widgets/recipes_of_day.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);
  final fooderApi = FirebaseFooderApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExploreData>(
      future: fooderApi.getExploreData(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          return ListView(
            children: [
              RecipesOfTheDay(recipes: snap.data?.recipesData ?? []),
              const SizedBox(height: 16),
              FriendPostListView(friendPosts: snap.data?.friendsFeed ?? []),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

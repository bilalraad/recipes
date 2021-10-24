import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/explore_data.dart';
import '../models/post.dart';
import '../models/recipe.dart';

import 'fake_data.dart';

abstract class FodderApi {}

class MockFooderApi {
  Future<ExploreData> getExploreData() async {
    try {
      final recipes = await _getRecipies();

      final feed = await _getFreindsFeed();
      return ExploreData(recipesData: recipes, friendsFeed: feed);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Recipe>> _getRecipies() async {
    await Future.delayed(const Duration(seconds: 1));
    var rawRecipies = exploreRecipies;

    List<Recipe> recipes = [];

    for (var rawRecipe in rawRecipies["recipes"]!) {
      Recipe recipe = Recipe.fromMap(rawRecipe);
      recipes.add(recipe);
    }

    return recipes;
  }

  Future<List<Post>> _getFreindsFeed() async {
    //Creates a future that runs its computation after a delay.
    // The computation will be executed after the given duration has passed
    //(here dart will continue after one second)
    await Future.delayed(const Duration(seconds: 1));

    var rawPostsData = freindsFeed;

    List<Post> friendsPosts = [];

    for (var post in rawPostsData["feed"]!) {
      Post friendPost = Post.fromMap(post);
      friendsPosts.add(friendPost);
    }

    return friendsPosts;
  }
}

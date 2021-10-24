import 'package:flutter/material.dart';
import '../../data/models/theme.dart';

import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  // 1
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool isFavourite = false;
  Future<bool> getFavourite() async {
    await Future.delayed(const Duration(seconds: 2));
    print('object');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 1
          Row(children: [
            CircleImage(
              imageProvider: widget.imageProvider,
              imageRadius: 28,
            ),
            // 2
            const SizedBox(width: 8),
            // 3
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.authorName,
                  style: FooderTheme.lightTextTheme.headline2,
                ),
                Text(
                  widget.title,
                  style: FooderTheme.lightTextTheme.headline3,
                )
              ],
            ),
          ]),
          IconButton(
            // 4
            icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            color: isFavourite ? Colors.red : Colors.grey[400],
            // 5
            onPressed: () async {
              print(await getFavourite());
              print('hello');
              // print(isFavourite);
              // Future.delayed(Duration(seconds: 2)).whenComplete(() {
              //   setState(() {
              //     isFavourite = !isFavourite;
              //     print(isFavourite);
              //   });
              // }).onError((error, stackTrace) {
              //   print(error);
              // });
              // print(isFavourite);
            },
          ),
        ],
      ),
    );
  }
}

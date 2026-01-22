import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailBottomAppBar extends ConsumerWidget {
  const RecipeDetailBottomAppBar({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
      height: 60,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                context.go('/home/restaurant/${recipe.title}');
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                // color: Colors.amber,
                child: const Row(
                  children: [
                    Icon(
                      Icons.maps_home_work_sharp,
                      color: pointColor,
                    ),
                    SizedBox(width: 3),
                    Text(
                      '식당',
                      style: TextStyle(color: pointColor),
                    ),
                  ],
                ),
              ),
            ),
            /*Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icons/icon-clap.png',
                ),
              ),
              Text('0'),
            ],
          ),*/
          ],
        ),
      ),
    );
  }
}

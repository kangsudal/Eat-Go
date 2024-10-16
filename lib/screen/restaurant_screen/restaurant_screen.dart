import 'package:eat_go/screen/restaurant_screen/restaurant_screen_back_button.dart';
import 'package:eat_go/screen/restaurant_screen/keyword_suggestion_card.dart';
import 'package:eat_go/screen/restaurant_screen/scrollable_cards.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  final String recipeId;
  const RestaurantScreen({
    super.key,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    int itemCount = 10;
    return Scaffold(
      backgroundColor: Colors.greenAccent,

      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            KeywordSuggestionCard(),
            RestaurantScreenBackButton(),
            ScrollableCards(itemCount: itemCount),
          ],
        ),
      ),
    );
  }
}

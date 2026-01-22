import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

class Top3Card extends StatelessWidget {
  const Top3Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: pointColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.1,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '레시피 명',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: pointColor,
                      size: 20,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      'N번 먹었어요',
                      style: TextStyle(
                        color: EatGoPalette.subTextColor,
                        fontSize: 11,
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
  }
}

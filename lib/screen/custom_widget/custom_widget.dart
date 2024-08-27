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
            decoration: BoxDecoration(
              color: pointColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.1,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '레시피 명',
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
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

class CustomListTile extends StatefulWidget {
  //일반 ListTile은 leading의 height 제약이 있어서, 만듬
  final Widget leading;
  final Widget mid;
  final Widget trailing;

  const CustomListTile({
    super.key,
    required this.leading,
    required this.mid,
    required this.trailing,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: EatGoPalette.lineColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          //권장 height: 70
          widget.leading,
          const SizedBox(width: 20),
          Expanded(
            child: widget.mid,
          ),
          widget.trailing,
        ],
      ),
    );
  }
}

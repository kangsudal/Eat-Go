import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

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
      // margin: const EdgeInsets.only(bottom: 20.0),
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

class CustomRadio<YummyTreat> extends StatelessWidget {
  final YummyTreat value;
  final YummyTreat groupValue;
  final ValueChanged<YummyTreat?> onChanged;
  final Widget child;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        return onChanged(value);
      },
    );
  }
}

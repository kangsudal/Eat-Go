import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  //일반 ListTile은 leading의 height 제약이 있어서, 만듬
  final Widget leading;
  final Widget mid;
  final Widget trailing;
  BoxDecoration? boxDecoration = BoxDecoration(
    border: Border.all(color: EatGoPalette.lineColor),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  CustomListTile({
    super.key,
    required this.leading,
    required this.mid,
    required this.trailing,
    BoxDecoration? boxDecoration,
  }) : boxDecoration = (boxDecoration ??
            BoxDecoration(
              border: Border.all(color: EatGoPalette.lineColor),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      // margin: const EdgeInsets.only(bottom: 20.0),
      decoration: boxDecoration,
      child: Row(
        children: [
          //권장 height: 70
          leading,
          const SizedBox(width: 20),
          Expanded(
            child: mid,
          ),
          trailing,
        ],
      ),
    );
  }

  CustomListTile copyWith({BoxDecoration? boxDecoration}) {
    return CustomListTile(
      leading: leading,
      mid: mid,
      trailing: trailing,
      boxDecoration: boxDecoration,
    );
  }
}

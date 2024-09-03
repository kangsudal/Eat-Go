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

class CustomRadio<YummyTreat> extends StatefulWidget {
  final YummyTreat value;
  final YummyTreat groupValue;
  final ValueChanged<YummyTreat?> onChanged;
  final CustomListTile child;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.child,
  });

  @override
  State<CustomRadio<YummyTreat>> createState() =>
      _CustomRadioState<YummyTreat>();
}

class _CustomRadioState<YummyTreat> extends State<CustomRadio<YummyTreat>> {
  late CustomListTile currentChild;

  @override
  void initState() {
    super.initState();
    currentChild = widget.child; // 초기 child 값을 상태에 저장
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = (widget.value == widget.groupValue);
    print('isSelected: $isSelected');

    if (isSelected) {
      this.currentChild = currentChild.copyWith(
        boxDecoration: BoxDecoration(
          color: pointColor,
          border: null,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      );
    } else {
      this.currentChild = currentChild.copyWith(
        boxDecoration: BoxDecoration(
          border: Border.all(color: EatGoPalette.lineColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      );
    }
    return GestureDetector(
      child: currentChild,
      onTap: () {
        return widget.onChanged(widget.value);
      },
    );
  }
}

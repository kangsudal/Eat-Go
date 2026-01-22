import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/custom_widget/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CustomRadio<YummyTreat> extends StatefulWidget {
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.child,
  });
  final YummyTreat value;
  final YummyTreat groupValue;
  final ValueChanged<YummyTreat?> onChanged;
  final CustomListTile child;

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
    // print('isSelected: $isSelected'); //라디오 개수만큼 build돼서 그만큼 출력됨

    if (isSelected) {
      currentChild = currentChild.copyWith(
        boxDecoration: const BoxDecoration(
          color: pointColor,
          border: null,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      );
    } else {
      currentChild = currentChild.copyWith(
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

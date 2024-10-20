import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({
    super.key,
  });

  @override
  State<AnimatedTextWidget> createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animatedController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animatedController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    final Animation<double> curvedAnimation = CurvedAnimation(
      parent: _animatedController,
      curve: Curves.easeOutSine,
    );

    //다수의 range를 가진 animation을 만들어야한다.
    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 40.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 40.0, end: -20.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -20.0, end: 7.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 7.0, end: -3.5), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -3.5, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
    ]).animate(curvedAnimation);

    //해석: CurvedAnimation: 가속도, TweenSequence: 범위

    _animation.addListener(() {
      //animation 값이 바뀔때마다 화면 반영

      //TweenSequence = 1 RANGE
      if (_animation.status == AnimationStatus.completed) {
        _animatedController.reverse();
      } else if (_animation.status == AnimationStatus.dismissed) {
        //끝에서부터 앞으로 와서 도달했을때를 감지. 그래서 앞에 reverse 부분을 지워서 없애면, 이것도 수행될 일이 없다.
        _animatedController.forward();
      }
      //setState를 할 필요없도록 AnimatedBuilder를 넣는다. AnimatedBuilder 내부만 다시그림
    });
    _animatedController.forward();
  }

  @override
  void dispose() {
    _animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return Transform.rotate(
          angle: _animation.value * 0.0174533, //double값을 radian 값으로 바꿔주는 수식
          child: Text(
            'SHAKE!',
            style: GoogleFonts.poppins(
              //HomeScreen에서 'SHAKE' 글씨
              fontSize: 70,
              fontWeight: FontWeight.w700,
              color: pointColor,
            ),
          ),
        );
      },
      animation: _animatedController,
    );
  }
}

import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/custom_widget/custom_list_tile.dart';

// import 'package:eat_go/screen/custom_widget/custom_radio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum YummyTreat {
  singleCoffee,
  fiveCupsOfCoffee,
  pizza,
  pizzaParty,
}

class YummyTreatScreen extends StatefulWidget {
  const YummyTreatScreen({super.key});

  @override
  State<YummyTreatScreen> createState() => _YummyTreatScreenState();
}

class _YummyTreatScreenState extends State<YummyTreatScreen> {
  YummyTreat? selectedValue; // 선택된 값을 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'BUY ME A YUMMY TREAT!',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.info_outline,
                  color: pointColor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '개발자를 후원해주셔서, 힘을 보태주세요!',
              style: TextStyle(
                color: EatGoPalette.subTextColor,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedValue = YummyTreat.singleCoffee;
                      });
                    },
                    child: selectedValue == YummyTreat.singleCoffee
                        ? CustomListTile(
                            leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.coffee,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            mid: Text(
                              '커피 한잔 쏘기',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                '\$3',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ).copyWith(
                            boxDecoration: const BoxDecoration(
                              color: pointColor,
                              border: null,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          )
                        : CustomListTile(
                            leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.coffee,
                                size: 35,
                              ),
                            ),
                            mid: Text('커피 한잔 쏘기'),
                            trailing: Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: EatGoPalette.lineColor,
                                  ),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                '\$3',
                                style: TextStyle(
                                  color: pointColor,
                                ),
                              )),
                            ),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedValue = YummyTreat.fiveCupsOfCoffee;
                      });
                    },
                    child: selectedValue == YummyTreat.fiveCupsOfCoffee
                        ? CustomListTile(
                            leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 30,
                                    bottom: 0,
                                    left: 30,
                                    right: 0,
                                    child: Text(
                                      'x5',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Icon(
                                      Icons.coffee,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            mid: Text(
                              '커피 다섯 잔의 기쁨',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '\$15',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ).copyWith(
                            boxDecoration: const BoxDecoration(
                              color: pointColor,
                              border: null,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          )
                        : CustomListTile(
                            leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 30,
                                    bottom: 0,
                                    left: 30,
                                    right: 0,
                                    child: Text('x5'),
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Icon(
                                      Icons.coffee,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            mid: Text('커피 다섯 잔의 기쁨'),
                            trailing: Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: EatGoPalette.lineColor,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '\$15',
                                  style: TextStyle(
                                    color: pointColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedValue = YummyTreat.pizza;
                      });
                    },
                    child: selectedValue == YummyTreat.pizza
                        ? CustomListTile(
                            leading: Image.asset(
                              'assets/icons/icon-pizza.png',
                              width: 50,
                              color: Colors.white,
                            ),
                            mid: Text(
                              '피자 한 판 선물',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: EatGoPalette.lineColor,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '\$20',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ).copyWith(
                            boxDecoration: const BoxDecoration(
                              color: pointColor,
                              border: null,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          )
                        : CustomListTile(
                            leading: Image.asset(
                              'assets/icons/icon-pizza.png',
                              width: 50,
                            ),
                            mid: Text('피자 한 판 선물'),
                            trailing: Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: EatGoPalette.lineColor,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '\$20',
                                  style: TextStyle(
                                    color: pointColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedValue = YummyTreat.pizzaParty;
                      });
                    },
                    child: selectedValue == YummyTreat.pizzaParty
                        ? CustomListTile(
                            leading: Image.asset(
                              'assets/icons/icon-pizza-box.png',
                              width: 50,
                              color: Colors.white,
                            ),
                            mid: Text(
                              '일년 동안 피자 파티',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '\$200',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ).copyWith(
                            boxDecoration: const BoxDecoration(
                              color: pointColor,
                              border: null,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          )
                        : CustomListTile(
                            leading: Image.asset(
                              'assets/icons/icon-pizza-box.png',
                              width: 50,
                              color: EatGoPalette.mainTextColor,
                            ),
                            mid: Text('일년 동안 피자 파티'),
                            trailing: Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: EatGoPalette.lineColor,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '\$200',
                                  style: TextStyle(
                                    color: pointColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: CupertinoButton(
                color: pointColor,
                child: Text(
                  'CONTINUE',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: selectedValue != null ? () {} : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

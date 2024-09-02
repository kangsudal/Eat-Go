import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/custom_widget/custom_widget.dart';
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
  bool isSelected = false;
  YummyTreat? selectedValueGroup1; // 선택된 값을 저장할 변수

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
            SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: 10),
                    child: CustomRadio(
                      value: YummyTreat.singleCoffee,
                      groupValue: selectedValueGroup1,
                      onChanged: (value) {
                        setState(() {
                          selectedValueGroup1 = value!;
                          print(selectedValueGroup1);
                        });
                      },
                      child: CustomListTile(
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
                  ),
                  Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: 10),
                    child: CustomRadio(
                      value: YummyTreat.fiveCupsOfCoffee,
                      groupValue: selectedValueGroup1,
                      onChanged: (value) {
                        setState(() {
                          selectedValueGroup1 = value!;
                          print(selectedValueGroup1);
                        });
                      },
                      child: SizedBox(
                        height: 120,
                        child: CustomListTile(
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
                    ),
                  ),
                  Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: 10),
                    child: CustomRadio(
                      value: YummyTreat.pizza,
                      groupValue: selectedValueGroup1,
                      onChanged: (value) {
                        setState(() {
                          selectedValueGroup1 = value!;
                          print(selectedValueGroup1);
                        });
                      },
                      child: SizedBox(
                        height: 120,
                        child: CustomListTile(
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
                    ),
                  ),
                  CustomRadio(
                    value: YummyTreat.pizzaParty,
                    groupValue: selectedValueGroup1,
                    onChanged: (value) {
                      setState(() {
                        selectedValueGroup1 = value!;
                        print(selectedValueGroup1);
                      });
                    },
                    child: SizedBox(
                      height: 100,
                      child: CustomListTile(
                        leading: Image.asset(
                          'assets/icons/icon-pizza-box.png',
                          width: 50,
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
                onPressed: isSelected ? () {} : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

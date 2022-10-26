import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bmi_result.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool _isMale = true;
  double _currentSliderValue = 180;
  int _weight = 45;
  int _age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 42, 18, 83),
        title: Text(
          'titleAppBar',
        ).tr(),
        actions: [
          IconButton(
              onPressed: () {
                if (context.locale == Locale('ar')) {
                  context.setLocale(Locale('en'));
                } else {
                  context.setLocale(Locale('ar'));
                }
              },
              icon: Icon(Icons.language_outlined))
        ],
      ),
      body: Container(
        color: Color(0xff0A0B1F),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _isMale = true;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _isMale
                                ? Colors.blue
                                : Color.fromARGB(255, 42, 18, 83),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/male.png',
                                width: 60.w,
                                height: 60.h,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              const Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ).tr(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _isMale = false;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: !_isMale
                                ? Color.fromARGB(255, 236, 68, 124)
                                : Color.fromARGB(255, 42, 18, 83),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/female.png',
                                width: 60.w,
                                height: 60.h,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              const Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ).tr(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 42, 18, 83),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ).tr(),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${_currentSliderValue.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ).tr(),
                        ],
                      ),
                      Slider(
                        activeColor: Colors.grey,
                        max: 220,
                        min: 40,
                        value: _currentSliderValue,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 42, 18, 83),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ).tr(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '$_weight',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    _weight++;
                                    setState(() {});
                                  },
                                  child: Icon(Icons.add),
                                  mini: true,
                                  backgroundColor: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    _weight--;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                  mini: true,
                                  backgroundColor: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 42, 18, 83),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Age',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ).tr(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '$_age',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    _age++;
                                    setState(() {});
                                  },
                                  child: Icon(Icons.add),
                                  mini: true,
                                  backgroundColor: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    _age--;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                  mini: true,
                                  backgroundColor: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 42, 18, 83),
              ),
              width: double.infinity,
              child: MaterialButton(
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    double result = _weight / pow(_currentSliderValue / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BMIRESULT(
                                result: result.round(),
                                isMale: _isMale,
                                age: _age,
                              )),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

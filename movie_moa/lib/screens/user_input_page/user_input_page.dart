import 'package:flutter/material.dart';
import 'package:movie_moa/constants/colors.dart';
import 'package:movie_moa/screens/home/widgets/grey_grid.dart';
import 'package:movie_moa/screens/search_screen/location_input.dart';
import 'package:movie_moa/screens/search_screen/search_object_list.dart';
// import 'package:movie_moa/screens/user_input_page/widgets/toggle_brand.dart';
// import 'package:movie_moa/screens/user_input_page/widgets/confirm_button.dart';
import 'package:movie_moa/screens/user_view_page/user_view_page.dart';
import 'package:movie_moa/screens/user_view_page/widgets/upper_title.dart';
import 'package:movie_moa/widgets/app_bar.dart';

class userInputPage extends StatefulWidget {
  List<bool> option;
  userInputPage({Key? key, required this.option}) : super(key: key);

  @override
  _userInputPageState createState() => _userInputPageState();
}

class _userInputPageState extends State<userInputPage> {
  double count = 0;
  late String _selectedTime1;
  late String _selectedTime2;
  final List<bool> _selections = List.generate(3, (index) => false);
  @override
  void initState() {
    _selectedTime1 = '시간을 설정해주세요';
    _selectedTime2 = '시간을 설정해주세요';
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [Upper_Title(), CustomAppBar()],
          ), //page_2 title
          grey_grid(),
          Column(
            children: [
              Container(
                height: height * 0.135,
                width: width,
                child: Stack(
                  children: [
                    SearchFunction(
                      hintText: "영화 검색",
                    ),
                  ],
                ),
              ),
              //SearchScreen(),
              grey_grid(),
              // SizedBox(height: height * 0.03),
              grey_grid(),
              Container(
                height: height * 0.135,
                width: width,
                child: Stack(
                  children: [
                    LocationInput(), //현재 장소 입력받는 함수.
                  ],
                ),
              ),
              grey_grid(),
              SizedBox(height: height * 0.03),
              // Text(widget.option.toString()),
              ElevatedButton(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: ''),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(Icons.timer),
                        ),
                      ),
                      TextSpan(text: '   $_selectedTime1'),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
                onPressed: () {
                  Future<TimeOfDay?> selectedTime1 = showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Color.fromARGB(255, 221, 88, 190),
                            onSurface: Color.fromARGB(255, 214, 132, 170),
                          ),
                          buttonTheme: ButtonThemeData(
                            colorScheme:
                                ColorScheme.light(primary: Colors.black),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  selectedTime1.then((timeOfDay) {
                    setState(() {
                      // _selectedTime = '${timeOfDay?.hour}시  ${timeOfDay?.minute}분';
                      if (timeOfDay?.minute == null ||
                          timeOfDay?.hour == null) {
                        _selectedTime1 = '(시간을 설정해주세요)';
                      } else if (timeOfDay?.minute == 0) {
                        _selectedTime1 =
                            '${timeOfDay?.hour}시 ${timeOfDay?.minute}0분 부터';
                      } else if (timeOfDay?.hour == 0) {
                        _selectedTime1 =
                            '${timeOfDay?.hour}0시 ${timeOfDay?.minute}분 부터';
                      } else {
                        _selectedTime1 =
                            '${timeOfDay?.hour}시 ${timeOfDay?.minute}분 부터';
                      }
                    });
                  });
                },
              ),
              ElevatedButton(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: ''),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(Icons.timer),
                        ),
                      ),
                      TextSpan(text: '   $_selectedTime2'),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
                onPressed: () {
                  Future<TimeOfDay?> selectedTime2 = showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Color.fromARGB(255, 221, 88, 190),
                            onSurface: Color.fromARGB(255, 214, 132, 170),
                          ),
                          buttonTheme: ButtonThemeData(
                            colorScheme:
                                ColorScheme.light(primary: Colors.black),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  selectedTime2.then((timeOfDay) {
                    setState(() {
                      // _selectedTime = '${timeOfDay?.hour}시  ${timeOfDay?.minute}분';

                      if (timeOfDay?.minute == null ||
                          timeOfDay?.hour == null) {
                        _selectedTime2 = '(시간을 설정해주세요)';
                      } else if (_selectedTime1 == _selectedTime2) {
                        _selectedTime2 = '(시간을 다시 설정해주세요)';
                      } else if (timeOfDay?.minute == 0) {
                        _selectedTime2 =
                            '${timeOfDay?.hour}시 ${timeOfDay?.minute}0분 까지';
                      } else if (timeOfDay?.hour == 0) {
                        _selectedTime2 =
                            '${timeOfDay?.hour}0시 ${timeOfDay?.minute}분 까지';
                      } else {
                        _selectedTime2 =
                            '${timeOfDay?.hour}시 ${timeOfDay?.minute}분 까지';
                      }
                    });
                  });
                },
              ),
              SizedBox(height: height * 0.04),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: Text('Cinema setting (Multiple selection possible)')),
              grey_grid(),
              // ToggleBrand(),
              /* ToggleButtons(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '     CGV   '),
                        WidgetSpan(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(Icons.movie),
                          ),
                        ),
                        TextSpan(text: '      '),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '     Lotte Cinema    '),
                        WidgetSpan(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(Icons.movie),
                          ),
                        ),
                        TextSpan(text: '      '),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '      Mega box    '),
                        WidgetSpan(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(Icons.movie)),
                        ),
                        TextSpan(text: '      '),
                      ],
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    _selections[index] = !_selections[index];
                  });
                },
                isSelected: _selections,
                selectedColor: Color.fromARGB(255, 182, 126, 192),
                hoverColor: Color.fromARGB(255, 235, 207, 216),
                fillColor: Color.fromARGB(255, 253, 234, 253),
              ),*/
              SizedBox(height: height * 0.03),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: Text('Number of pop-up lists')),
              grey_grid(),
              Container(
                  alignment: Alignment.center,
                  child: Text('< 팝업되는 리스트는 $count개입니다. >')),
              Container(
                  alignment: Alignment.center,
                  child: Slider(
                      value: count,
                      min: 0.0,
                      max: 100.0,
                      activeColor: Color.fromARGB(255, 240, 191, 207),
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          count = value.toInt() as double;
                        });
                      })),
              grey_grid(),
              SizedBox(height: height * 0.03),
              // Confirm_Button(),
              RawMaterialButton(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 229, 190, 236), //* 버튼 색상 변경
                    borderRadius: BorderRadius.circular(width * 0.1),
                    //shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.fromLTRB(
                      width * 0.3, 0, width * 0.3, 0), //* 마진 변경 및 텍스트 스타일 설정
                  child: Text('Next',
                      style: TextStyle(
                        fontSize: height * 0.025,
                        color: Colors.black,
                      )),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => User_View_Page(
                          selection: _selections,
                          time1: _selectedTime1,
                          time2: _selectedTime2,
                          cnt: count.toInt(),
                        ))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

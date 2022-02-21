import 'package:flutter/material.dart';
import 'package:movie_moa/constants/colors.dart';
import 'package:movie_moa/screens/home/widgets/grey_grid.dart';
import 'package:movie_moa/screens/search_screen/location_input.dart';
import 'package:movie_moa/screens/search_screen/movie_autocomplete.dart';
import 'package:movie_moa/screens/user_input_page/widgets/toggle_brand.dart';
import 'package:movie_moa/screens/user_input_page/widgets/confirm_button.dart';
import 'package:movie_moa/screens/user_input_page/widgets/option_selection.dart';
import 'package:movie_moa/screens/user_view_page/widgets/upper_title.dart';
import 'package:movie_moa/widgets/app_bar.dart';

class userInputPage extends StatefulWidget {
  const userInputPage({Key? key}) : super(key: key);

  @override
  _userInputPageState createState() => _userInputPageState();
}

class _userInputPageState extends State<userInputPage> {
  late String _selectedTime;
  @override
  void initState() {
    _selectedTime = '00시 00분';
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    double count = 0;
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
                height: height * 0.115,
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
              SizedBox(height: height * 0.03),
              grey_grid(),
              Container(
                height: height * 0.115,
                width: width,
                //padding:
                //  EdgeInsets.fromLTRB(0, height * 0.01, 0, height * 0.01),
                child: Stack(
                  children: [
                    LocationInput(), //현재 장소 입력받는 함수.
                  ],
                ),
              ),
              grey_grid(),
              SizedBox(height: height * 0.03),
              Option_Selection(
                hintText:
                    "현재 설정된 시각은 $_selectedTime 입니다. \n 시간을 변경하려면 아래 아이콘을 눌러주세요.",
                icon: Icon(Icons.access_time_outlined),
                onChanged: (value) {},
              ),
              ElevatedButton(
                // child: Icon(Icons.timer),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: '시간을 변경하시려면 눌러주세요    '),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(Icons.timer),
                        ),
                      ),
                      TextSpan(text: ''),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
                onPressed: () {
                  Future<TimeOfDay?> selectedTime = showTimePicker(
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
                  selectedTime.then((timeOfDay) {
                    setState(() {
                      // _selectedTime = '${timeOfDay?.hour}시  ${timeOfDay?.minute}분';
                      if (timeOfDay?.minute == 0) {
                        _selectedTime =
                            '${timeOfDay?.hour}시 ${timeOfDay?.minute}0분';
                      } else if (timeOfDay?.hour == 0) {
                        _selectedTime =
                            '${timeOfDay?.hour}0시 ${timeOfDay?.minute}분';
                      } else {
                        _selectedTime =
                            '${timeOfDay?.hour}시 ${timeOfDay?.minute}분';
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
              Container(
                child: ToggleBrand(),
              ),
              SizedBox(height: height * 0.03),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: Text('Number of pop-up lists')),
              grey_grid(),
              Container(
                  alignment: Alignment.center, child: Text('< 팝업되는 리스트 개수 >')),
              Container(
                  alignment: Alignment.center,
                  child: Slider(
                    value: count.toDouble(),
                    min: 0.0,
                    max: 100.0,
                    activeColor: Color.fromARGB(255, 240, 191, 207),
                    inactiveColor: Colors.grey,
                    onChanged: (double newValue) {
                      count = newValue.round() as double;
                    },
                  )),
              grey_grid(),
              SizedBox(height: height * 0.03),
              Confirm_Button(),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_moa/screens/user_input_page/user_input_page.dart';
import 'package:movie_moa/screens/home/widgets/grey_grid.dart';

class OptionSet extends StatefulWidget {
  @override
  _OptionSetState createState() => _OptionSetState();
}

class _OptionSetState extends State<OptionSet> {
  //final _OptionList = ['영화','장소', '시간'];
  final List<bool> _options = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    return Stack(
      //Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: ToggleButtons(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: '      영화    '),
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
                            TextSpan(text: '      장소    '),
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(Icons.location_city),
                              ),
                            ),
                            TextSpan(text: '      '),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: '      시간    '),
                            WidgetSpan(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Icon(Icons.access_time_outlined)),
                            ),
                            TextSpan(text: '      '),
                          ],
                        ),
                      ),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        _options[index] = !_options[index];
                      }
                    );
                  },
                    isSelected: _options,
                    selectedColor: Color.fromARGB(255, 182, 126, 192),
                    hoverColor: Color.fromARGB(255, 235, 207, 216),
                    fillColor: Color.fromARGB(255, 253, 234, 253),
                )
              ),
            ),
            //SizedBox(height: 15),
            grey_grid(),
            RawMaterialButton(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 229, 190, 236), //* 버튼 색상 변경
                  borderRadius: BorderRadius.circular(width * 0.1),
                  //shape: BoxShape.circle,
                ),
                margin: EdgeInsets.fromLTRB(width * 0.3, 0, width * 0.3, 0), //* 마진 변경 및 텍스트 스타일 설정
                child: Text('Next',
                    style: TextStyle(
                      fontSize: height * 0.025,
                      color: Colors.black,
                    )),
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => userInputPage( option : _options))),
            ),
          ],
        )
      ], 
    );
  }
}
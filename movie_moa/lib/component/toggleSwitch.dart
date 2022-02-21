import 'package:flutter/material.dart';
import 'package:movie_moa/screens/home/widgets/grey_grid.dart';

class ToggleSwitch extends StatefulWidget {
  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  //final _OptionList = ['영화','장소', '시간'];
  final List<bool> _selections = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
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
                        TextSpan(
                            text: '      영화    ',
                            style: TextStyle(color: Colors.black)),
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
                        TextSpan(
                            text: '      장소    ',
                            style: TextStyle(color: Colors.black)),
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
                        TextSpan(
                            text: '      시간    ',
                            style: TextStyle(color: Colors.black)),
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
                    _selections[index] = !_selections[index];
                  });
                },
                isSelected: _selections,
                selectedColor: Color.fromARGB(255, 182, 126, 192),
                hoverColor: Color.fromARGB(255, 235, 207, 216),
                fillColor: Color.fromARGB(255, 253, 234, 253),
              )),
            ),
            //SizedBox(height: 15),
            grey_grid(),
          ],
        )
      ],
    );
  }
}

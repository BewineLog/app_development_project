import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_moa/component/variable.dart';
import 'package:movie_moa/constants/colors.dart';
import 'package:substring_highlight/substring_highlight.dart';

class SearchFunction extends StatefulWidget {
  SearchFunction({Key? key, required this.hintText}) : super(key: key);

  final String hintText;

  @override
  _SearchFunctionState createState() => _SearchFunctionState();
}

class _SearchFunctionState extends State<SearchFunction> {
  bool isLoading = false;
  late List<String> autoCompleteData;
  late TextEditingController controller;
  late FocusNode focusNode;

  late Iterable<String> searchHistory;
  List<String> searchHistory_ = [];

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });
    final String stringData = widget.hintText == "영화 검색"
        ? await rootBundle.loadString("assets/files/test.json")
        : await rootBundle.loadString("assets/non.json");
    //await rootBundle.loadString("assets/local.json");
    final data = await jsonDecode(stringData);
    List<String> jsonStringData = [];
    List json = [];

    setState(() {
      json = data['items'];
    });

    for (int i = 0; i < json.length; i++) {
      jsonStringData.add(json[i]['name']);
    }
    // final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  /* @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }*/

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        /*키보드가 올라오면서 화면 깨지는 현상 방지 */
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Autocomplete(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return searchHistory_;
                          //return search_word;
                        } else {
                          return autoCompleteData.where((word) => word
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()));
                        }
                      },
                      optionsViewBuilder:
                          (context, Function(String) onSelected, options) {
                        return Material(
                            child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final option = options.elementAt(index);
                            return ListTile(
                              title: SubstringHighlight(
                                text: option.toString(),
                                term: controller.text,
                              ),
                              subtitle: Text(widget.hintText),
                              onTap: () {
                                onSelected(option.toString());
                              },
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: options.length,
                        ));
                      },
                      onSelected: (selectedString) {
                        if (selectedString != Null) {
                          searchHistory_.add(selectedString.toString());
                          movieName = selectedString.toString();
                          //search_word.add(selectedString.toString());
                        }
                        print(selectedString);
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        this.controller = controller;
                        this.focusNode = focusNode;
                        return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: kGridColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: kGridColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: kGridColor),
                            ),
                            labelText: widget.hintText,
                            prefixIcon: Icon(Icons.movie_outlined),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ));
  }
}

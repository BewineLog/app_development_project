import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:movie_moa/component/rounded_input_field.dart';
import 'package:movie_moa/screens/search_screen/widgets/movie_data.dart';

class AutocompleteFunc extends StatefulWidget {
  const AutocompleteFunc({Key? key}) : super(key: key);

  @override
  State<AutocompleteFunc> createState() => _AutocompleteFuncState();
}

class _AutocompleteFuncState extends State<AutocompleteFunc> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  String? selected_movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.01,
      padding: EdgeInsets.all(8),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            movieName(),
          ],
        ),
      ),
    );
  }

  Widget movieName() => TypeAheadFormField<String?>(
        suggestionsCallback: movie_data.getSuggestions,
        itemBuilder: (context, String? suggestion) =>
            ListTile(title: Text(suggestion!)),
        onSuggestionSelected: (suggestion) {
          controller.text = suggestion!;
        },
        textFieldConfiguration: TextFieldConfiguration(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.movie_outlined),
            labelText: "영화 검색",
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
        ),
        validator: (value) =>
            value != null && value.isEmpty ? 'Please select the movie' : null,
        onSaved: (value) => selected_movie = value,
      );
}

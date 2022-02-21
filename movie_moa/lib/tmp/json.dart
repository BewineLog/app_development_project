import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class jsonFile extends StatefulWidget {
  const jsonFile({Key? key}) : super(key: key);

  @override
  _jsonFileState createState() => _jsonFileState();
}

class _jsonFileState extends State<jsonFile> {
  late File jsonFile;
  late Directory dir;
  String fileName = "jsonFile.json";
  bool fileExists = false;
  late Map<String, String> fileContent;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        setState(() => fileContent = jsonDecode(jsonFile.readAsStringSync()));
      }
    });
  }

  void createFile(Map<String, String> content, Directory dir, String fileName) {
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(jsonEncode(content));
    // return file;
  }

  void writeFile(String key, String value) {
    Map<String, String> content = {key: value};
    if (fileExists) {
      Map<String, String> jsonFileContent =
          jsonDecode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(jsonEncode(jsonFileContent));
    } else {
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = jsonDecode(jsonFile.readAsStringSync()));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

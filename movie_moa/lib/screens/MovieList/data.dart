import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:movie_moa/DB/movieRankingInfo.dart';
import 'package:movie_moa/component/variable.dart';
import 'package:movie_moa/constants/colors.dart';

part 'data.g.dart';

@JsonSerializable()
class data {
  final String rank; //순위
  final String openDt; //개봉일자
  final String movieNm; //영화이름
  final String audiAcc; //누적관객수
  final String audiCnt; //일관객수

  data(this.rank, this.openDt, this.movieNm, this.audiAcc, this.audiCnt);

  factory data.fromJson(Map<String, dynamic> json) => _$dataFromJson(json);
  Map<String, dynamic> toJson() => _$dataToJson(this);
}

String getToday() {
  DateTime now = DateTime.now().subtract(Duration(days: 1));
  DateFormat dateFormat = DateFormat("yyyyMMdd");
  String today = dateFormat.format(now);

  return today;
}

Future<void> fetchData() async {
  String today = getToday();
  String key = 'key=' + 'cb6a1468b7f2a1f4e4f6f975042372f2'.toString();
  String targetDt = '&targetDt=$today';
  String url =
      'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?' +
          key +
          targetDt;
  http.Response response = await http.get(Uri.parse(url));
  List<data> returnData = [];

  try {
    final jsonData = response.body;
    final json = jsonDecode(jsonData)["boxOfficeResult"]["dailyBoxOfficeList"];
    for (int i = 0; i < json.length; i++) {
      //print(data.fromJson(json[i]).movieNm);
      returnData.add(data.fromJson(json[i]));
    }
    //print(returnData);
    //return returnData;

    //Insert Data to DB
    var provider = DBHelper_ri();

    for (int j = 0; j < returnData.length; j++) {
      var tmpData = Data(
          adminId,
          returnData[j].openDt,
          returnData[j].movieNm,
          returnData[j].rank,
          returnData[j].audiAcc,
          returnData[j].audiCnt); // Data 꼬여서 들어감 수정요망.
      provider.insertData(tmpData);
      adminId++;
    }
    print(await provider.data());
  } catch (err) {
    throw Exception('$err');
  }
}




/*@JsonSerializable()
class data {
  final String movieNm; //영화이름
  final String rank; //순위
  final String openDt; //개봉일자
  final String audiAcc; //누적관객수
  final String audiCnt; //일관객수

  data(this.movieNm, this.rank, this.openDt, this.audiAcc, this.audiCnt);

  factory data.fromJson(Map<String, dynamic> json) => _$dataFromJson(json);
  Map<String, dynamic> toJson() => _$dataToJson(this);
}

String getToday() {
  DateTime now = DateTime.now().subtract(Duration(days: 1));
  DateFormat dateFormat = DateFormat("yyyyMMdd");
  String today = dateFormat.format(now);

  return today;
}

Future<List<data>> fetchData() async {
  String today = getToday();
  String key = 'key=' + 'cb6a1468b7f2a1f4e4f6f975042372f2'.toString();
  String targetDt = '&targetDt=$today';
  String url =
      'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?' +
          key +
          targetDt;
  http.Response response = await http.get(Uri.parse(url));
  List<data> returnData = [];
  try {
    final jsonData = response.body;
    final json = jsonDecode(jsonData)["boxOfficeResult"]["dailyBoxOfficeList"];
    for (int i = 0; i < json.length; i++) {
      //print(data.fromJson(json[i]).movieNm);
      returnData.add(data.fromJson(json[i]));
    }
    //print(returnData);
    return returnData;
  } catch (err) {
    throw Exception('$err');
  }
}

class movieList extends StatefulWidget {
  const movieList({Key? key}) : super(key: key);

  @override
  State<movieList> createState() => _movieListState();
}

class _movieListState extends State<movieList> {
  //movieList({Key? key}) : super(key: key);
  late Future<List<data>> rankingData;
  @override
  void initState() {
    super.initState();
    rankingData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('MovieRanking')),
        backgroundColor: kBackgroundColor,
        body: Padding(
            padding: const EdgeInsets.all(5),
            child: FutureBuilder<List<data>>(
              future: rankingData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, int index) => Card(
                      child: ListTile(
                          title: Text(
                        snapshot.data![index].rank +
                            "/" +
                            snapshot.data![index].movieNm +
                            "/" +
                            snapshot.data![index].audiCnt,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )));
  }
}
 */

import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:movie_moa/component/variable.dart';

class Crawler {
  String theaterName = '롯데시네마도곡'; //향후 사용자 입력 값을 받을 수 있도록 해야함.
  String urlBody =
      "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=";
  late String url = urlBody + theaterName;

  List<String> tmp = [];

  void getData() async {
    final response = await http.get(Uri.parse(url));
    final body = response.body;
    final html = parse(body);

    final htmlBody = html.querySelector(".list_tbl_box");

    final data = htmlBody?.querySelector("tbody");

    final dataMv = data?.querySelectorAll("th > a");
    final dataTm = data?.querySelectorAll("td");

    for (int i = 0; i < dataMv!.length; i++) {
      crawlingData.add(dataMv[i].text);
    }
  }
}

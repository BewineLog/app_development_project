import 'package:http/http.dart' as http;
import 'dart:convert';

//Future<http.Response> fetchPost() {
// return http.get(Uri.parse('http://127.0.0.1'));
//}

class Post {
  final String name;
  Post({required this.name});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(name: json['items']);
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:5000'));

  if (response.statusCode == 200) {
    // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
    //
    var responsebody = json.decode(response.body);
    print(responsebody);
    return Post.fromJson(json.decode(response.body));
  } else {
    // 만약 응답이 OK가 아니면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

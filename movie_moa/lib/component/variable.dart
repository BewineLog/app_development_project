bool id_check = false; //for login check
bool passwd_check = false; //for login check =>login_page, profile_bar

bool profile = false;

String location = ''; // 2페이지 입력 현재 위치 값 -> search_screen's variable
String movieName = ''; // 2페이지 입력 영화 이름 값 -> movie_autocomplete's variable

bool val = false; //mypage bookmark onoff value
List<String> list = [
  'test1',
  'test2',
];

List<String> crawlingData = []; // crawling data 임시 저장

int adminId = 1111111111; //use DB admin id for movie rank
int initId = adminId; //use DB admin id init value for movie rank

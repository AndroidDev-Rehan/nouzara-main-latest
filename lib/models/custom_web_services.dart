class CustomWebServices {
  //////////////////////////////Base urls for Post & Get data
  static String baseUrl = 'https://www.nzeora.com/wp-json/api/v1/';
  static String baseUrlLogedin = 'https://www.nzeora.com/wp-json/wp/v2/';
  ///////////////////////////////////// Authentication variables
  static String loginUrl = "${baseUrl}token";
  static String userName = "username";
  static String userPassword = "password";

  static String signupUrl = '${baseUrlLogedin}users/register';
  static String userEmail = "email";
  ////////////////////////////////////////////// UserData List (Every user will have a unique Token ID)

  //////////////////////////////// Blog Post Get.Json link
  static String getPostsUrl =
      'https://www.nzeora.com/wp-json/wp/v2/posts?_embed&page=1&per_page=10';
  //////////////////////Latets Blog Post link
  static String getLatestPostUrl =
      "https://www.nzeora.com/wp-json/wp/v2/posts?categories=";
////RECENT CATEGORIES
  static String getrecentCategories =
      "https://www.nzeora.com/wp-json/wp/v2/posts";
  ////////////////// Posts related links
  static String getCategoryPostUrl =
      "https://www.nzeora.com/wp-json/wp/v2/posts?_embed&categories=";
  static String getSearchNewsUrl =
      "https://www.nzeora.com/wp-json/wp/v2/posts?_embed&page=1&per_page=10&search=";
  static String getVideosUrl =
      "https://www.nzeora.com/wp-json/wp/v2/media?media_type=video&page=1&per_page=100";
  ///////////////blog comments
  static String getCommentsUrl =
      "https://www.nzeora.com/wp-json/wp/v2/comments?post=";
  //////GETTING USERS DATA
  static String getUserData = "https://www.nzeora.com/wp-json/wp/v2/users/me";
}

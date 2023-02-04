class AppLinkApi {
  static const String server = "http://192.168.1.35/ecommerce/";
  static const String imagestatic = "assets/images";

  // auth

  static const String signup = "$server/auth/signup.php";
  static const String authVerifycode = "$server/auth/verifycode.php";
  static const String login = "$server/auth/login.php";
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String resetpassVerifycode =
      "$server/forgetpassword/verifycode.php";
  static const String resendverifycode = "$server/auth/resend.php";

  // Home
  static const String homepage = "$server/home.php";
  static const String items = "$server/items/items.php";

  //Favorite
  static const String addFav = "$server/favorite/add.php";
  static const String removeFav = "$server/favorite/remove.php";
  static const String favoriteview = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";
}

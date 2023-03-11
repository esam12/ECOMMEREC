import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/middleware/mymiddleware.dart';
import 'package:ecommerec/view/screen/auth/forgetPassword/forgetpassword.dart';
import 'package:ecommerec/view/screen/auth/login.dart';
import 'package:ecommerec/view/screen/auth/forgetPassword/resetpassword.dart';
import 'package:ecommerec/view/screen/auth/signup.dart';
import 'package:ecommerec/view/screen/auth/forgetPassword/success_resetpassword.dart';
import 'package:ecommerec/view/screen/auth/success_signup.dart';
import 'package:ecommerec/view/screen/auth/forgetPassword/verifycode.dart';
import 'package:ecommerec/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerec/view/screen/cart.dart';
import 'package:ecommerec/view/screen/homescreen.dart';
import 'package:ecommerec/view/screen/itemsscreen.dart';
import 'package:ecommerec/view/screen/language.dart';
import 'package:ecommerec/view/screen/myfavorite.dart';
import 'package:ecommerec/view/screen/onboarding.dart';
import 'package:ecommerec/view/screen/productdetails.dart';
import 'package:ecommerec/view/screen/settings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),
  //GetPage(name: "/", page: () => const Cart()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPass, page: () => const ResetPassword()),
  GetPage(name: AppRoute.verifycode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.itemscreen, page: () => const ItemsScreen()),
  GetPage(name: AppRoute.myfavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.settigns, page: () => const Settings()),
];

// Map<String, Widget Function(BuildContext)> routes = {
//   //Auth
//   AppRoute.login: (context) => const Login(),
//   AppRoute.signUp: (context) => const SignUp(),
//   AppRoute.forgetPassword: (context) => const ForgetPassword(),
//   AppRoute.resetPass: (context) => const ResetPassword(),
//   AppRoute.verifycode: (context) => const VerifyCode(),
//   AppRoute.successSignUp: (context) => const SuccessSignUp(),
//   AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
//   AppRoute.verfiyCodeSignUp: (context) => const VerfiyCodeSignUp(),

//   //OnBoarding
//   AppRoute.onBoarding: (context) => const OnBoarding(),
// };

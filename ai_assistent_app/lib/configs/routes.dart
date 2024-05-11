import 'package:ai_assistent_app/screens/chat_screen.dart';
import 'package:ai_assistent_app/screens/init_screen.dart';
import 'package:ai_assistent_app/screens/join_screen.dart';
import 'package:ai_assistent_app/screens/login_screen.dart';
import 'package:ai_assistent_app/screens/main_screen.dart';
import 'package:ai_assistent_app/screens/genres_selection_screen.dart';
import 'package:ai_assistent_app/screens/movies_selection_screen.dart';
import 'package:ai_assistent_app/screens/result_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const init = '/init';
  static const main = '/main';
  static const login = '/login';
  static const join = '/join';
  static const chat = '/chat';
  static const genresSelection = '/genresSelection';
  static const moviesSelection = '/moviesSelection';
  static const resultScreen = '/resultScreen';

  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.init,
      page: () => const InitScreen(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.join,
      page: () => const JoinScreen(),
    ),
    GetPage(
      name: Routes.chat,
      page: () => const ChatScreen(),
    ),
    GetPage(
      name: Routes.genresSelection,
      page: () => const GenresSelectionScreen(),
    ),
    GetPage(
      name: Routes.moviesSelection,
      page: () => const MoviesSelectionScreen(),
    ),
    GetPage(
      name: Routes.resultScreen,
      page: () => const ResultScreen(),
    ),
  ];
}

import 'package:library_book/main.dart';

export 'package:flutter/services.dart';
export 'package:flutter/material.dart';
export 'package:library_book/common/styles.dart';
export 'package:library_book/common/book_data.dart';
export 'dart:async';

// => page
export 'package:library_book/pages/user/book_by_year_page.dart';
export 'package:library_book/pages/user/bookmark_page.dart';
export 'package:library_book/pages/user/latest_book_page.dart';
export 'package:library_book/pages/user/library_book_page.dart';
export 'package:library_book/pages/user/history_page.dart';
export 'package:library_book/pages/user/home_page.dart';
export 'package:library_book/pages/user/profile_page.dart';
export 'package:library_book/pages/user/search_page.dart';
export 'package:library_book/pages/admin/set_book_page.dart';
export 'package:library_book/pages/welcome_page.dart';
export 'package:library_book/pages/user/main_page.dart';
export 'package:library_book/pages/register_page.dart';
export 'package:library_book/pages/login_page.dart';
export 'package:library_book/pages/user/detail_book_page.dart';
export 'package:library_book/pages/admin/dashboard_page.dart';

// => Widget
export 'package:library_book/widgets/book_by_year_list.dart';
export 'package:library_book/widgets/book_list.dart';
export 'package:library_book/widgets/bookmark_list.dart';
export 'package:library_book/widgets/history_list.dart';
export 'package:library_book/widgets/latest_book_list.dart';
export 'package:library_book/widgets/library_book_list.dart';
export 'package:library_book/widgets/admin_book_list.dart';
export 'package:library_book/widgets/devider_or.dart';

// => Assets
export 'package:flutter_svg/svg.dart';
export 'package:lottie/lottie.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: bgColor,
  ));
  runApp(const GoBooks());
}

class GoBooks extends StatelessWidget {
  const GoBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'goBooks',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: bgColor,
              secondary: accentColor,
            ),
        textTheme: myTextTheme,
      ),
      home: const WelcomePage(),
      // home: const MainPage(),
      // home: const AdminProfilePage(),

      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const MainPage());
          case BookmarkPage.routeName:
            return MaterialPageRoute(builder: (_) => const BookmarkPage());
          case LatestBookPage.routeName:
            return MaterialPageRoute(builder: (_) => const LatestBookPage());
          case AdminMainPage.routeName:
            return MaterialPageRoute(builder: (_) => const AdminMainPage());
          case AdminProfilePage.routeName:
            return MaterialPageRoute(builder: (_) => const AdminProfilePage());
          case ProfilePage.routeName:
            return MaterialPageRoute(builder: (_) => const ProfilePage());
          case LibraryBookPage.routeName:
            return MaterialPageRoute(builder: (_) => const LibraryBookPage());
          default:
            return MaterialPageRoute(builder: (_) {
              return const Scaffold(
                body: Center(
                  child: Text('Page not found :('),
                ),
              );
            });
        }
      },
    );
  }
}

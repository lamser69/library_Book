import 'package:library_book/main.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);
  static const routeName = '/bookmark_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: accentColor,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Bookmark',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 25),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: bookUrl.length,
        itemBuilder: (context, index) {
          return BookmarkList(index: index);
        },
      ),
    );
  }
}

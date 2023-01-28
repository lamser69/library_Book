import 'package:library_book/main.dart';

class LatestBookPage extends StatelessWidget {
  const LatestBookPage({Key? key}) : super(key: key);
  static const routeName = '/latest_book_page';

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
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Populer',
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
          return BookList(index: index);
        },
      ),
    );
  }
}

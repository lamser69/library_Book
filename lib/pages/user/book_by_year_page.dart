import 'package:library_book/main.dart';

class BookByYearPage extends StatelessWidget {
  static const routeName = '/bookByYearPage';

  final int minYear;
  final int maxYear;

  const BookByYearPage({Key? key, required this.minYear, required this.maxYear})
      : super(key: key);

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
        title: maxYear > 1899
            ? Text('$maxYear - $minYear',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: accentColor, fontSize: 25))
            : Text('> 1899',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: accentColor, fontSize: 25)),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: bookUrl.length,
        itemBuilder: (context, index) {
          return BookByYearList(index: index);
        },
      )
    );
  }
}

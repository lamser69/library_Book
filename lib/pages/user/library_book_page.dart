import 'package:library_book/main.dart';

class LibraryBookPage extends StatelessWidget {
  const LibraryBookPage({Key? key}) : super(key: key);
  static const routeName = '/library_book_page';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          ),
        ),
        centerTitle: true,
        title: Text(
          'List Buku Perpustakaan',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: bookUrl.length,
              itemBuilder: (context, index) {
                return BookList(index: index);
              },
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                width: size.width * 0.90,
                child: Text(
                  'Jumlah buku : ${bookTitle.length}',
                  style: const TextStyle(
                    // color: accentColor,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}

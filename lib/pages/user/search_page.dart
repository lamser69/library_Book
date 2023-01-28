import 'package:library_book/main.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const routeName = '/search_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 120,
        elevation: 0,
        title: Text(
          'Pencarian\n\n',
          style: Theme
              .of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 25),
        ),
        flexibleSpace: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.search_rounded,
                        color: secdarkColor,
                      ),
                      hintText: "Cari Judul atau Penulis",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {}),
              ),
            ),
          ],
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
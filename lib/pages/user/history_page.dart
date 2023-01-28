import 'package:library_book/main.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
  static const routeName = '/history_page';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: const TabBar(
              indicatorColor: accentColor,
              tabs: [
                Tab(
                    icon: Text('Masih dipinjam',
                        style: TextStyle(
                            color: secdarkColor, fontWeight: FontWeight.bold))),
                Tab(
                    icon: Text('Sudah dikembalikan',
                        style: TextStyle(
                            // color: accentColor,
                            color: secdarkColor,
                            fontWeight: FontWeight.bold))),
              ],
            ),
            title: Text(
              'Riwayat Peminjaman',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: accentColor, fontSize: 22),
            ),
            centerTitle: true,
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TabBarView(
              children: [
                Tab(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: bookUrl.length,
                    itemBuilder: (context, index) {
                      if (isAvailable[index] == false) {
                        return HistoryList(index: index);
                      } else {
                        return const Center();
                      }
                    },
                  ),
                ),
                Tab(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: bookUrl.length,
                    itemBuilder: (context, index) {
                      if (isAvailable[index] == true) {
                        return HistoryList(index: index);
                      } else {
                        return const Center();
                      }
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

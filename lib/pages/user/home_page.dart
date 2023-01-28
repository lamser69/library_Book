import 'package:library_book/main.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'LibraryBook',
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: accentColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, BookmarkPage.routeName);
            },
            icon: const Icon(
              Icons.bookmark_outline_rounded,
              color: Colors.black,
              size: 25,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 17),
                padding: const EdgeInsets.symmetric(horizontal: 17),
                height: size.height * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: secLightColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Text(
                            'Selamat datang di LibraryBook',
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          width: 160,
                          child: Text(
                            'Ayo kembangkan jiwa literasi mulai sekarang.',
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/image/banner.png',
                      fit: BoxFit.fitWidth,
                      width: 125,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tahun dipublikasi',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: accentColor),
                ),
              ),
              SizedBox(
                  height: size.height * 0.075,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _bookByYearWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return BookByYearPage(
                                minYear: 2010,
                                maxYear: DateTime.now().year,
                              );
                            }),
                          );
                        },
                        numberOfPages: 'Sekarang - 2010',
                      ),
                      _bookByYearWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const BookByYearPage(
                                minYear: 1975,
                                maxYear: 2009,
                              );
                            }),
                          );
                        },
                        numberOfPages: '2009 - 1975',
                      ),
                      _bookByYearWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const BookByYearPage(
                                minYear: 1950,
                                maxYear: 1974,
                              );
                            }),
                          );
                        },
                        numberOfPages: '1974 - 1950',
                      ),
                      _bookByYearWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const BookByYearPage(
                                minYear: 1900,
                                maxYear: 1949,
                              );
                            }),
                          );
                        },
                        numberOfPages: '1949 - 1900',
                      ),
                      _bookByYearWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const BookByYearPage(
                                minYear: 0,
                                maxYear: 1899,
                              );
                            }),
                          );
                        },
                        numberOfPages: '> 1899',
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              _buildSubHeading(
                title: 'List Buku Perpustakaan',
                onTap: () {
                  Navigator.pushNamed(context, LibraryBookPage.routeName);
                },
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bookUrl.length,
                  itemBuilder: (context, index) {
                    return LibraryBookList(index: index);
                  },
                ),
              ),
              _buildSubHeading(
                title: 'Populer',
                onTap: () {
                  Navigator.pushNamed(context, LatestBookPage.routeName);
                },
              ),
              SizedBox(
                height: 277,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bookUrl.length,
                  itemBuilder: (context, index) {
                    return LatestBookList(index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({
    required String title,
    required Function() onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor),
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Lainnya',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: secLightColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  InkWell _bookByYearWidget(
      {required Function() onTap, required String numberOfPages}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 4, left: 6, bottom: 7, top: 7),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            const Icon(Icons.date_range, color: accentColor),
            const SizedBox(width: 3),
            Text(
              numberOfPages,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

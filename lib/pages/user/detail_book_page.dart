import 'package:library_book/main.dart';

class DetailBookPage extends StatefulWidget {
  final int index;
  const DetailBookPage({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailBookPage> createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          bookTitle[widget.index],
          style: Theme.of(context).textTheme.
          headline6?.copyWith(
            color: accentColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: const Icon(
                  Icons.bookmark_outline_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
          ),
        ],
        backgroundColor: Colors.blue.withOpacity(0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 16),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                bookUrl[widget.index],
                                fit: BoxFit.cover,
                                height: 210,
                              ),
                            ),
                          ),

                          isAvailable[widget.index] == true ?
                          Text(
                            'Tersedia',
                            style: Theme.of(context).textTheme.
                            caption?.copyWith(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ) :
                          Text(
                            'Buku telah dipesan',
                            style: Theme.of(context)
                                .textTheme.caption
                                ?.copyWith(color: Colors.green, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),

                          isWaiting[widget.index] == false ?
                          Container(
                            width: size.width * 0.35,
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: secdarkColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(2, 3),
                                ),
                              ],
                            ),
                            child: InkWell(
                                onTap: () {
                                  if (isAvailable[widget.index] == true) {
                                    setState(() {
                                      isWaiting[widget.index] = true;
                                      const oneSec = Duration(seconds: 5);
                                      Timer(oneSec, () => setState(() {
                                        isWaiting[widget.index] = false;
                                        isAvailable[widget.index] = !isAvailable[widget.index];
                                        },
                                      ));
                                    });
                                  } else {
                                    setState(() {
                                      isWaiting[widget.index] = true;
                                      const oneSec = Duration(seconds: 5);
                                      Timer(oneSec, () => setState(() {
                                        isWaiting[widget.index] = false;
                                        isAvailable[widget.index] = !isAvailable[widget.index];
                                        },
                                      ));
                                    });
                                    // isAvailable[widget.index] = !isAvailable[widget.index];
                                  }
                                },
                                child: isAvailable[widget.index] == true ?
                                Text(
                                  'PINJAM',
                                  style: Theme.of(context)
                                      .textTheme.button
                                      ?.copyWith(color: Colors.white),
                                ) :
                                Text(
                                  'KEMBALIKAN',
                                  style: Theme.of(context)
                                      .textTheme.button
                                      ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                            ),
                          ) :
                          Container(
                            width: size.width * 0.35,
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: secdarkColor.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(2, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              'Menunggu Konfirmasi',
                              style: Theme.of(context)
                                  .textTheme.button
                                  ?.copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 7,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text(
                          //   bookTitle[widget.index],
                          //   style: Theme.of(context).textTheme.headline6?.
                          //   copyWith(color: Colors.black, fontSize: 24),
                          //   textAlign: TextAlign.center,
                          // ),
                          // Text(
                          //   'Judul Lengkap',
                          //   style: Theme.of(context).textTheme.headline6?.
                          //   copyWith(color: accentColor, fontSize: 20),
                          //   textAlign: TextAlign.center,
                          // ),
                          // Text(
                          //   bookTitle[widget.index],
                          //   textAlign: TextAlign.center,
                          // ),
                          Text(
                            'Author',
                            style: Theme.of(context).textTheme.headline6?.
                            copyWith(color: accentColor, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            author[widget.index],
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 8.0,),

                          Text(
                            'Penerbit',
                            style: Theme.of(context).textTheme.headline6?.
                            copyWith(color: accentColor, fontSize: 18),
                          ),
                          Text(
                            publisher[widget.index],
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 8.0,),

                          Text(
                            'Total Halaman',
                            style: Theme.of(context).textTheme.headline6?.
                            copyWith(color: accentColor, fontSize: 16),
                          ),
                          Text('${totalOfPages[widget.index]}'),

                          const SizedBox(height: 8.0,),

                          Text(
                            'Tahun Terbit',
                            style: Theme.of(context).textTheme.headline6?.
                            copyWith(color: accentColor, fontSize: 16),
                          ),

                          Text('${yearPublished[widget.index]}'),

                          const SizedBox(height: 8.0,),

                          Text(
                            'Letak Buku',
                            style: Theme.of(context).textTheme.headline6?.
                            copyWith(color: accentColor, fontSize: 16),
                          ),
                          Text(bookLocation[widget.index]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 9),
              padding: const EdgeInsets.all(8.0),
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sinopsis',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: accentColor),
                    ),
                    Text(
                      synopsis[widget.index],
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

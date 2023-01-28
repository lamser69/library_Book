import 'package:library_book/common/book_data.dart';
import 'package:library_book/main.dart';

class BookmarkList extends StatelessWidget {
  final int index;
  const BookmarkList({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetailBookPage(index: index))
      ),
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    bookUrl[index],
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 130,
                            child: Text(
                              bookTitle[index],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: accentColor,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Text(
                              author[index],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         content: Text(
                          //             'Menghapus buku dari bookmark.'),
                          //         duration: Duration(milliseconds: 500)));
                        },
                        icon: Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          child: const Icon(
                            Icons.bookmark,
                            color: Colors.black,
                            size: 25,
                          ),
                        )
                        //     : Container(
                        //   margin: const EdgeInsets.only(right: 8.0),
                        //   child: const Icon(
                        //     Icons.bookmark_outline_rounded,
                        //     color: Colors.black,
                        //     size: 25,
                        //   ),
                        // )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

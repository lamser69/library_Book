import 'package:library_book/main.dart';

class LatestBookList extends StatelessWidget {
  final int index;
  const LatestBookList({Key? key, required this.index,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetailBookPage(index: index)),
      ),
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.fromLTRB(6, 13, 10, 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    bookUrl[index],
                    fit: BoxFit.cover,
                    width: 110,
                    height: 140,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 110,
                child: Text(
                  bookTitle[index],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 14,
                      ),
                ),
              ),
              SizedBox(
                width: 110,
                child: Text(
                  author[index],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 13),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

part of 'pages.dart';

class ListPage extends StatefulWidget {
  final String kategori;

  const ListPage({this.kategori});
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // List<Map<String, dynamic>> kamus = [
  //   {
  //     'kata': 'Kala',
  //     'makna': 'makna',
  //     'deskripsi': 'deskripsi',
  //   },
  //   {
  //     'kata': 'Ku',
  //     'makna': 'makna',
  //     'deskripsi': 'deskripsi',
  //   },
  //   {
  //     'kata': 'Seorang',
  //     'makna': 'makna',
  //     'deskripsi': 'deskripsi',
  //   },
  //   {
  //     'kata': 'Diri',
  //     'makna': 'makna',
  //     'deskripsi': 'deskripsi',
  //   },
  //   {
  //     'kata': 'Hanya',
  //     'makna': 'makna',
  //     'deskripsi': 'deskripsi',
  //   },
  //   {
  //     'kata': 'Berteman',
  //     'makna': 'makna',
  //     'deskripsi': 'deskripsi',
  //   },
  //   {
  //     'kata': 'Sepi',
  //     'makna': 'makna',
  //     'deskripsi': 'deskripsi',
  //   },
  //   {
  //     'kata': 'dan angin',
  //     'makna': 'makna',
  //     'deskripsi': 'deskripsi',
  //   },
  //   {
  //     'kata': 'malam',
  //     'makna': 'makna',
  //     'deskripsi': 'deskripsi',
  //   },
  // ];

  DatabaseService _databaseService = new DatabaseService();

  List<Kamus> kamus;

  void getKamus(String kategori) {
    // Scaffold.of(context).hideCurrentSnackBar();
    final Future<Database> dbFuture = _databaseService.initDB();
    dbFuture.then((database) {
      Future<List<Kamus>> kamusListFuture = _databaseService.getWhere(kategori);
      kamusListFuture.then((kamusList) {
        setState(() {
          kamus = kamusList;
          // count = kamusList.length;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kamus == null) {
      kamus = new List<Kamus>();
      getKamus(widget.kategori);
    }
    return Template(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          // navbar widget
          NavbarWidget(
            title: 'Kamus ${widget.kategori} - Indonesia',
            onBackButtonPressed: () {
              Navigator.of(context).pop();
            },
            onInfoPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Alune"),
                      content: Text("Dialog Content"),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        )
                      ],
                    );
                  });
            },
          ),
          // search bar widget
          SearchBarWidget(),
          // list of kamus
          Expanded(
              child: Container(
            margin: EdgeInsets.only(top: 10),
            child: ListView.builder(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: kamus.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListCardWidget(
                    kata: kamus[index].kata,
                    makna: kamus[index].makna,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(kamus: kamus[index])),
                      );
                    },
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}

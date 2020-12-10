part of 'pages.dart';

class ListPage extends StatefulWidget {
  final String kategori;

  const ListPage({this.kategori});
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Map<String, String> info = {
    'alune':
        'Bahasa Alune merupakan salah satu bahasa daerah di Pulau Seram, khususnya Seram Barat.\nFungsi bahasa Alune bagi pemakainya ialah\n(1) sebagai alat komunikasi dan bahasa pergaulan dalam kehidupan sehari-hari;\n(2) alat komunikasi pada upacara adat-istiadat dan upacara perkawinan (alamanang); \n(3) sebagai bahasa pengantar dalain sastra lisan yang dipadu dengan tarian cakalele, mamiri, maru-maru, otomaru, atau sastra lisan yang disampaikan secara bersenandung di waktu malam (wele-wele) ada yang berbentuk pantun dan ada juga yang berbentuk kapata.\nDaerah pemakai bahasa Alune berkisar di antara daerah aliran tiga sungai di Seram Baratt, yaitu Sungai Eti, Tala, dan Sapalew dan berkisar antara tiga wilayah kecamatan, yaitu Keeamatah Taniwal, Kechmatan Piru, dan Kecamatan Kairatu.',
    'wemale':
        'Suku Wemale adalah masyarakat yang mendiami pulau Seram Bagian Barat . \nMereka berjumlah 7.500 dan tinggal di 39 desa di pulau Seram.\nWemale adalah salah satu suku tertua di pulau Seram yang dikelompokan dalam rumpun patasiwa.\nSebagian besar suku Wemale bertani dan makan pokok mereka adalah sagu.\nSuku Wemale Nudusiwa adalah masyarakat yang mendiami pulau Seram Bagian Barat memiliki tradisi yang telah diwariskan secara turun temurun mengandung nilai kesakralan yang sangat dijunjung tinggi.'
  };

  DatabaseService _databaseService = new DatabaseService();

  List<Kamus> kamus;

  void getKamus(String kategori, {String search}) {
    // Scaffold.of(context).hideCurrentSnackBar();
    final Future<Database> dbFuture = _databaseService.initDB();
    dbFuture.then((database) {
      Future<List<Kamus>> kamusListFuture =
          _databaseService.getWhere(kategori, search: search);
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
            title: 'Kamus ${widget.kategori.capitalizeFirstofEach} - Indonesia',
            onBackButtonPressed: () {
              Navigator.of(context).pop();
            },
            onInfoPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("${widget.kategori}"),
                      content: ListView(children: [
                        Text((widget.kategori == 'alune')
                            ? info['alune'].capitalizeFirstofEach
                            : info['wemale'].capitalizeFirstofEach)
                      ]),
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
          SearchBarWidget(
            kategori: widget.kategori,
            onSearch: (val) {
              getKamus(widget.kategori, search: val);
            },
          ),
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
                            builder: (context) => DetailPage(
                                kamus: kamus[index],
                                kategori: widget.kategori)),
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

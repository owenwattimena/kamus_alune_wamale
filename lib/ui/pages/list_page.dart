part of 'pages.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, dynamic>> kamus = [
    {
      'kata': 'Kala',
      'makna': 'makna',
      'deskripsi': 'deskripsi',
    },
    {
      'kata': 'Ku',
      'makna': 'makna',
      'deskripsi': 'deskripsi',
    },
    {
      'kata': 'Seorang',
      'makna': 'makna',
      'deskripsi': 'deskripsi',
    },
    {
      'kata': 'Diri',
      'makna': 'makna',
      'deskripsi': 'deskripsi',
    },
    {
      'kata': 'Hanya',
      'makna': 'makna',
      'deskripsi': 'deskripsi',
    },
    {
      'kata': 'Berteman',
      'makna': 'makna',
      'deskripsi': 'deskripsi',
    },
    {
      'kata': 'Sepi',
      'makna': 'makna',
      'deskripsi': 'deskripsi',
    },
    {
      'kata': 'dan angin',
      'makna': 'makna',
      'deskripsi': 'deskripsi',
    },
    {
      'kata': 'malam',
      'makna': 'makna',
      'deskripsi': 'deskripsi',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: 20),
          // navbar widget
          NavbarWidget(
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
          SizedBox(height: 32),
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
                    kata: kamus[index]['kata'],
                    makna: kamus[index]['makna'],
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

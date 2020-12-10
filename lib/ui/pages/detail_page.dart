part of 'pages.dart';

class DetailPage extends StatelessWidget {
  final Kamus kamus;
  final String kategori;

  const DetailPage({this.kamus, this.kategori});

  @override
  Widget build(BuildContext context) {
    return Template(
      child: ListView(
        children: [
          NavbarWidget(
            title: 'Kamus ${kategori.capitalizeFirstofEach} - Indonesia',
            showInfo: false,
            onBackButtonPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ListCardWidget(
              kata: kamus.kata,
              makna: kamus.makna,
              deskripsi: kamus.deskripsi,
            ),
          ),
        ],
      ),
    );
  }
}

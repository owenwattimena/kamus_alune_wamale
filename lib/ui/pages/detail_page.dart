part of 'pages.dart';

class DetailPage extends StatelessWidget {
  final Kamus kamus;

  const DetailPage({this.kamus});

  @override
  Widget build(BuildContext context) {
    return Template(
      child: ListView(
        children: [
          NavbarWidget(
            title: 'Kamus Alune - Indonesia',
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

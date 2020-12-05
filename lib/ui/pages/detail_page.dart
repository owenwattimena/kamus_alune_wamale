part of 'pages.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> kamus;

  const DetailPage({this.kamus});

  @override
  Widget build(BuildContext context) {
    return Template(
      child: ListView(
        children: [
          SizedBox(height: 20),
          NavbarWidget(
            showInfo: false,
            onBackButtonPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.all(10),
            child: ListCardWidget(
              kata: kamus['kata'],
              makna: kamus['makna'],
              deskripsi: kamus['deskripsi'],
            ),
          ),
        ],
      ),
    );
  }
}

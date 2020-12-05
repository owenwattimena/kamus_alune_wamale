part of 'pages.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _saranController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        NavbarWidget(
          title: 'Saran',
          showInfo: false,
          onBackButtonPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: accentColor, width: 2),
          ),
          child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Nama"),
              style: TextStyle(fontSize: 18)),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: accentColor, width: 2),
          ),
          child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Email"),
              style: TextStyle(fontSize: 18)),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: accentColor, width: 2),
          ),
          child: TextField(
              controller: _saranController,
              maxLines: 6,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Saran"),
              style: TextStyle(fontSize: 18)),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: FlatButton(
            color: accentColor,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: Text(
                'KIRIM',
                style: whiteFontStyle2,
              ),
            ),
          ),
        )
      ]),
    );
  }
}

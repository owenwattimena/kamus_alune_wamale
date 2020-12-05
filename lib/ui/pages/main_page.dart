part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Color(0xffFFFFFF),
        ),
        SafeArea(
          child: Container(
              child: ListView(
            children: [
              SizedBox(height: 50),
              Column(children: [
                Container(
                  width: 165,
                  height: 165,
                  decoration: BoxDecoration(color: Color(0xffA55103)),
                ),
                SizedBox(height: 24),
                Text('Kamus Alune Wemale - Indonesia',
                    style: blackFontStyle1.copyWith(fontSize: 19)),
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      MenuCardWidget(
                        title: 'ALUNE',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListPage()),
                          );
                        },
                      ),
                      SizedBox(width: 10),
                      MenuCardWidget(title: 'WEMALE')
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      MenuCardWidget(
                        title: 'SARAN',
                      ),
                      SizedBox(width: 10),
                      MenuCardWidget(title: 'TENTANG')
                    ],
                  ),
                ),
              ]),
              SizedBox(height: 50),
            ],
          )),
        ),
      ],
    ));
  }
}

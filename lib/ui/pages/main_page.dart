part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: primaryColor,
        ),
        SafeArea(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ic_bg.jpg'),
                    fit: BoxFit.fill),
              ),
              child: ListView(
                children: [
                  SizedBox(height: 370),
                  Column(children: [
                    // Container(
                    //   width: 165,
                    //   height: 165,
                    //   decoration: BoxDecoration(color: Color(0xffA55103)),
                    // ),
                    // SizedBox(height: 24),
                    // Text('Kamus Alune Wemale - Indonesia',
                    //     style: blackFontStyle1.copyWith(fontSize: 19)),
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
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ListPage(kategori: 'alune')),
                              );
                            },
                          ),
                          SizedBox(width: 10),
                          MenuCardWidget(
                              title: 'WEMALE',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListPage(kategori: 'wemale')),
                                );
                              })
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeedbackPage()),
                              );
                            },
                          ),
                          SizedBox(width: 10),
                          MenuCardWidget(
                            title: 'TENTANG',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage()),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ]),
                ],
              )),
        ),
      ],
    ));
  }
}

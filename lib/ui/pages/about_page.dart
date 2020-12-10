part of 'pages.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Template(
        child: Column(
      children: [
        NavbarWidget(
            title: 'Tentang',
            showInfo: false,
            onBackButtonPressed: () {
              Navigator.of(context).pop();
            }),
        Column(children: [
          GFAccordion(
              expandedTitleBackgroundColor: accentColor,
              collapsedTitleBackgroundColor: accentColor,
              titleChild: Text('Kamus',
                  style: blackFontStyle3.copyWith(color: Colors.white)),
              // title: 'GF Accordion',
              content:
                  'Kamus yang berisikan tentang data bahasa Alune dan Wemale.\nWemale dan Alune adalah dua suku tertua di pulau Seram yang dikelompokan dalam rumpun patasiwa.\nSebagian besar suku Wemale dan Alune bertani dan makan pokok mereka adalah sagu.\nSuku Wemale adalah masyarakat yang mendiami pulau Seram Bagian Barat,\nsedangkan Alune adalah masyarakat di wilayah barat-tengah pulau. ',
              collapsedIcon: Icon(Icons.add, color: Colors.white),
              expandedIcon: Icon(Icons.minimize, color: Colors.white)),
          GFAccordion(
              expandedTitleBackgroundColor: accentColor,
              collapsedTitleBackgroundColor: accentColor,
              titleChild: Text('Peneliti',
                  style: blackFontStyle3.copyWith(color: Colors.white)),
              // title: 'GF Accordion',
              content: 'Nama : Jahra Ely \nNIM : 1316144086 \n',
              collapsedIcon: Icon(Icons.add, color: Colors.white),
              expandedIcon: Icon(Icons.minimize, color: Colors.white)),
        ])
      ],
    ));
  }
}

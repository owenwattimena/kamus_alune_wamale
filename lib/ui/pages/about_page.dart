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
                  'GetWidget is an open source library that comes with pre-build 1000+ UI components.',
              collapsedIcon: Icon(Icons.add, color: Colors.white),
              expandedIcon: Icon(Icons.minimize, color: Colors.white)),
          GFAccordion(
              expandedTitleBackgroundColor: accentColor,
              collapsedTitleBackgroundColor: accentColor,
              titleChild: Text('Peneliti',
                  style: blackFontStyle3.copyWith(color: Colors.white)),
              // title: 'GF Accordion',
              content:
                  'GetWidget is an open source library that comes with pre-build 1000+ UI components.',
              collapsedIcon: Icon(Icons.add, color: Colors.white),
              expandedIcon: Icon(Icons.minimize, color: Colors.white)),
        ])
      ],
    ));
  }
}

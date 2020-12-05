part of 'pages.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    });
    return Template(
        backColor: secondaryColor,
        child: Column(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: accentColor,
                image: DecorationImage(
                  image: AssetImage('assets/images/ic_kamus.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ]));
  }
}

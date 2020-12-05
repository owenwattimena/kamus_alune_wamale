part of 'pages.dart';

class Template extends StatelessWidget {
  final Widget child;

  const Template({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Color(0xffFFFFFF),
        ),
        SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  child: child,
                  // color: Colors.red,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

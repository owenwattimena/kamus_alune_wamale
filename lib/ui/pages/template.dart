part of 'pages.dart';

class Template extends StatelessWidget {
  final Widget child;
  final Color backColor;

  const Template({this.child, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          color: backColor ?? Color(0xffFFFFFF),
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

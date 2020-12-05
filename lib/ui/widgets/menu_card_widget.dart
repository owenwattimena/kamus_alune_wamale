part of 'widgets.dart';

class MenuCardWidget extends StatelessWidget {
  final String title;
  final Function onTap;

  const MenuCardWidget({this.title = 'title', this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '$title',
              style:
                  blackFontStyle2.copyWith(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

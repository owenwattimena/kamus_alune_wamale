part of 'widgets.dart';

class NavbarWidget extends StatelessWidget {
  final bool showInfo;
  final Function onBackButtonPressed;
  final Function onInfoPressed;
  final String title;

  NavbarWidget(
      {this.showInfo = true,
      this.onBackButtonPressed,
      this.onInfoPressed,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 32),
      child: Row(
        mainAxisAlignment: (showInfo)
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: onBackButtonPressed,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(right: defaultMargin),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/back_icon.png"))),
            ),
          ),
          Text(
            '$title',
            style: blackFontStyle2.copyWith(fontSize: 18),
          ),
          (showInfo)
              ? InkWell(
                  onTap: onInfoPressed,
                  child: Container(
                    // padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.only(left: defaultMargin),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/info_icon.png"))),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

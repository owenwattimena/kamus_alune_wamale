part of 'widgets.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(8),
            border: Border.all(color: secondaryColor),
          ),
          child: Row(children: [
            Container(
              // padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(right: defaultMargin),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/search_icon.png"))),
            ),
            Expanded(
              child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: "Cari Kata"),
                  style: TextStyle(fontSize: 18)),
            ),
          ]),
        ),
      ),
    );
  }
}

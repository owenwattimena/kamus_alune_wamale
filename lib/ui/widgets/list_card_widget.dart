part of 'widgets.dart';

class ListCardWidget extends StatelessWidget {
  final Function onTap;
  final String kata;
  final String makna;
  final String deskripsi;

  const ListCardWidget(
      {this.onTap, this.kata = 'kata', this.makna = 'makna', this.deskripsi});

  @override
  Widget build(BuildContext context) {
    FlutterTts flutterTts = FlutterTts();

  Future _speak(String kata) async {
    var result = await flutterTts.speak(kata);
  }
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.only(bottom: 8),
            // height: 70.5,
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 23),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: accentColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$kata',
                            style: whiteFontStyle2.copyWith(fontSize: 20)),
                        Text(
                          '$makna',
                          style: whiteFontStyle2.copyWith(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                        (deskripsi != null)
                            ? Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  '$deskripsi',
                                  style: whiteFontStyle2.copyWith(fontSize: 14),
                                ),
                              )
                            : SizedBox(),
                      ]),
                ),
                IconButton(
                  icon: new Icon(MdiIcons.volumeHigh, color: Colors.white),
                  onPressed: (){
                    _speak(kata);
                  },
                )
              ],
            )),
      ),
    );
  }
}

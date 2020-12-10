part of 'pages.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  bool messageProses = false;
  String _email = 'elyjahra24@gmail.com';
  String _password = 'mataharisenja';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _saranController = TextEditingController();

  void sendEmail(String nama, email, saran) async {
    setState(() {
      messageProses = true;
    });
    // ignore: deprecated_member_use
    final smtpServer = gmail(_email, _password);
// Create our email message.
    final message = Message()
      ..from = Address(_email)
      ..recipients.add('elyjahra@gmail.com') //recipent email
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com']) //cc Recipents emails
      // ..bccRecipients.add(Address('bccAddress@example.com')) //bcc Recipents emails
      ..subject = 'Saran dan masukan' //subject of the email
      ..text =
          'Nama : $nama\nEmail : $email\nSaran : $saran'; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      messageStatus('Saran berhasil dikirim.');
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
      setState(() {
        messageProses = false;
      });
    } on MailerException catch (e) {
      messageStatus('Saran gagal dikirim');
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
      setState(() {
        messageProses = false;
      });
    }
  }

  void messageStatus(String status) {
    Fluttertoast.showToast(
        msg: "$status",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        NavbarWidget(
          title: 'Saran',
          showInfo: false,
          onBackButtonPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: accentColor, width: 2),
          ),
          child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Nama"),
              style: TextStyle(fontSize: 18)),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: accentColor, width: 2),
          ),
          child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Email"),
              style: TextStyle(fontSize: 18)),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: accentColor, width: 2),
          ),
          child: TextField(
              controller: _saranController,
              maxLines: 6,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Saran"),
              style: TextStyle(fontSize: 18)),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: FlatButton(
            color: accentColor,
            onPressed: (!messageProses)
                ? () {
                    sendEmail(_nameController.text, _emailController.text,
                        _saranController.text);
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: (!messageProses)
                  ? Text(
                      'KIRIM',
                      style: whiteFontStyle2,
                    )
                  : CircularProgressIndicator(),
            ),
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrRendRead extends StatefulWidget {
  @override
  _QrRendReadState createState() => _QrRendReadState();
}

class _QrRendReadState extends State<QrRendRead> {
  @override
  bool isRead = false;
  TextEditingController _textEditingController;
  String url = "";

  QrImage rendedQr = new QrImage(data: null);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton(
              child: isRead
                  ? Opacity(
                      opacity: 0.4,
                      child: Text(
                        "URL to QR",
                      ))
                  : Text(
                      "URL to QR",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
              onPressed: () => setState(() => isRead = false),
            ),
            FlatButton(
                child: isRead
                    ? Text(
                        "QR to URL",
                        style: TextStyle(decoration: TextDecoration.underline),
                      )
                    : Opacity(opacity: 0.4, child: Text("QR to URL")),
                onPressed: () => setState(() => isRead = true)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: isRead ? readQr() : rendQr(),
        ),
      ),
    );
  }

  Widget rendQr() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                maxLines: 1,
                controller: _textEditingController,
                onChanged: (value) => url = value,
              ),
              RaisedButton(
                child: Text("QRコードに変換"),
                onPressed: () => setState(() => rendedQr =
                    QrImage(data: url, version: QrVersions.auto, size: 200.0)),
              ),
            ],
          ),
          QrImage(data: url, version: QrVersions.auto, size: 200.0)
        ],
      ),
    );
  }

  Widget readQr() {
    return Container(child: Text("not implemented "));
  }
}

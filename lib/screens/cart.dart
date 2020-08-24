import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartState();
}

class _CartState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      
      bottomNavigationBar: _buildButtomNavigationBar(),
    );
  }

  int i = 0;
  int j = 0;

  _makeGetRequest() async {
    String url = 'https://champagne-kiwi-5860.twil.io/yeni';
    Response response = await get(url);
    Map<String, String> headers = response.headers;
    String json = response.body;
    i++;
    j==0;
  }

  _makeGetRequest2() async {
    String url = 'https://champagne-kiwi-5860.twil.io/siparisiptal';
    Response response = await get(url);
    Map<String, String> headers = response.headers;
    String json = response.body;
    j++;
    i==0;
  }

  _buildButtomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 38.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: () {
                if (j == 0) {
                  _makeGetRequest2();
                  confirmDialog2(context);
                } else {
                  confirmDialog3(context);
                }
              },
              color: Colors.red,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Satın Almayı İptal Et",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: () {
                if (i == 0) {
                  _makeGetRequest();
                  confirmDialog1(context); 
                } else {
                  confirmDialog3(context);
                }
              },
              color: Colors.greenAccent,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.assignment_turned_in,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Satın Almayı Onayla",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> confirmDialog1(BuildContext context) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Satın Alma İşleminiz Onaylandı"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<bool> confirmDialog2(BuildContext context) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Satın Alma İşleminiz İptal Edildi"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<bool> confirmDialog3(BuildContext context) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Lütfen Butona Sadece Bir Kez Basınız"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

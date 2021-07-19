import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webview_flutter/webview_flutter.dart';

class LoadviewHtml extends StatefulWidget {


  @override
  _LoadviewHtmlState createState(){
    return _LoadviewHtmlState();

  }
}

class _LoadviewHtmlState extends State<LoadviewHtml> {
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Loadview HTML'),
        centerTitle: true,
      ),
    body: WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: '',
      onWebViewCreated: (WebViewController webViewController){
        _controller = webViewController;
        _loadHtmlFromAssets();
      },
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _controller.evaluateJavascript('value("Seema S", "seemasenthil399@gmail.com", "03-08-1999")');
        },
      ),
    );
  }
  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/files/test.html');
        _controller.loadUrl(UriData.fromString(
          fileText,
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8')
        ).toString());
  }
}

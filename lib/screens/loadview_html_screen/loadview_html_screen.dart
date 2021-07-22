import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';

import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';

class LoadviewHtml extends StatefulWidget {
  @override
  _LoadviewHtmlState createState() {
    return _LoadviewHtmlState();
  }
}

class _LoadviewHtmlState extends State<LoadviewHtml> {
  String generatedPdfFilePath;
  @override
  void initState() {
    super.initState();
    generateExampleDocument();
  }

  Future<void> generateExampleDocument() async {
    final htmlContent = """
    <!DOCTYPE html>
    <html>
<head></head>
    <script>
    function value(val1,val2,val3){
    var str1 = document.getElementById("string1")
    str1.innerHTML = val1;
    var str2 = document.getElementById("string2")
    str2.innerHTML = val2;
    var str3 = document.getElementById("string3")
    str3.innerHTML = val3;

    };
    </script>

    <body>
    <center>
        <h1> User Information </h1></center>
    <p class ="p1"><span class = "s1">Name:Seema S</span><span id="string1"></span></p>
    <p class ="p2"><span class ="s1"></span></p>
    <p class ="p1"><span class ="s1">Email:seeamsenthil399@gmail.com</span><span id="string2"></span></p>
    <p class ="p2"><span class ="s1"></span></p>
    <p class ="p1"><span class ="s1">Gender:Female</span>&nbsp;<span id="string3"></span></p>
   


    <p class="p2"><span class="s1"></span></p>
    <p class="p1"><span class="s1"><span class="Apple-converted-space"> </span></span><br></p>
    <p id="string4">
    <p class="p2"><span class="s1"></span><br></p>
    </body>

</html>
""";
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = appDocDir.path;
    final targetFileName = "example-pdf";

    final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Html to PDF'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("view PDF"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PDFViewerScaffold(
                      appBar: AppBar(title: Text("Generated PDF Document")),
                      path: generatedPdfFilePath)),
            );
          },
        ),
      ),
    );
  }
}

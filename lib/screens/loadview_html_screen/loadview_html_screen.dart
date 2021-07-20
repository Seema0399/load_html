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
    final htmlContent = "files/test.html";
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
      appBar: AppBar(),
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

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

import '../features/colors.dart';

class Python extends StatefulWidget {
  const Python({super.key});

  @override
  State<Python> createState() => _PythonState();
}

class _PythonState extends State<Python> {
  late PdfControllerPinch pdfControllerPinch;
  int  totalPage = 0, currentPage = 1;
  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(document: PdfDocument.openAsset(
        'assets/pdf/data_analytics_with_python.pdf'
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        title: Text("Data Analytics with Python",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black
          ),),
      ),
      body: _buildPdfView(),
    );
  }
  Widget _buildPdfView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Total Pages : ${totalPage}",
                style: TextStyle(
                    fontSize: 17
                ),),
              IconButton(
                  onPressed: (){
                    pdfControllerPinch.previousPage(duration: (Duration(milliseconds: 200)), curve: Curves.linear);
                  },
                  icon: Icon(Icons.arrow_back_ios_new,
                    size: 20,)),
              Text("current Page : ${currentPage}",
                style: TextStyle(
                    fontSize: 17
                ),),
              IconButton(onPressed: (){
                pdfControllerPinch.nextPage(duration: (Duration(milliseconds: 200)), curve: Curves.linear);

              },
                  icon: Icon(Icons.arrow_forward_ios_outlined,
                      size: 20)),
            ],
          ),
        ),
        _pdfView(),
      ],
    );
  }
  Widget _pdfView() {
    return Expanded(
      child: PdfViewPinch(
        controller: pdfControllerPinch,
        scrollDirection: Axis.vertical,
        onDocumentLoaded: (document) {
          setState(() {
            totalPage = document.pagesCount;
          });
        },
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }
}

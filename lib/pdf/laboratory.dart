import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

import '../features/colors.dart';

class Laboratory extends StatefulWidget {
  const Laboratory({super.key});

  @override
  State<Laboratory> createState() => _LaboratoryState();
}

class _LaboratoryState extends State<Laboratory> {
  late PdfControllerPinch pdfControllerPinch;
  int  totalPage = 0, currentPage = 1;
  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(document: PdfDocument.openAsset(
        'assets/pdf/lab.pdf'
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        title: Text("Laboratory",
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

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ViewPdf extends StatefulWidget {
  const ViewPdf({Key? key}) : super(key: key);

  @override
  State<ViewPdf> createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  String? dir;
  @override
  void initState() {
    super.initState();
  }

  Future<void> getDownload() async {
    if (Platform.isIOS) {
      dir = (await getApplicationDocumentsDirectory()).path;
    } else {
      dir = "/sdcard/download/";
    }
    print(dir!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () async {
                try {
                  var status = await Permission.storage.status;
                  if (!status.isGranted) {
                    await Permission.storage.request();
                  }
                  getDownload();
                  print(dir);
                  await Dio().download(
                      'http://africau.edu/images/default/sample.pdf',
                      dir! + "/sample.pdf");
                  // print(status);
                  // if (status) {
                  //   getDownload();
                  //   print(dir);
                  //   await Dio().download(
                  //       'http://africau.edu/images/default/sample.pdf',
                  //       dir! + "/sample.pdf");
                  // }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('export'))
        ],
      ),
      body: Container(
        child: const PDF().cachedFromUrl(
          'http://africau.edu/images/default/sample.pdf',
          placeholder: (progress) => Center(child: Text('$progress %')),
          errorWidget: (error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'file_splitter_home_page.dart';

class FileSplitterPage extends StatelessWidget {
  const FileSplitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Splitter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FileSplitterHomePage(),
    );
  }
}

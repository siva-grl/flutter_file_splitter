import 'package:flutter/material.dart';
import '../../data/repositories/file_repository_impl.dart';
import '../../data/datasources/file_picker_local_datasource.dart';
import '../../data/datasources/file_splitter_local_datasource.dart';

class FileSplitterHomePage extends StatefulWidget {
  const FileSplitterHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FileSplitterHomePageState createState() => _FileSplitterHomePageState();
}

class _FileSplitterHomePageState extends State<FileSplitterHomePage> {
  late FileRepositoryImpl _fileRepository;

  @override
  void initState() {
    super.initState();
    // Initialize data sources and repository
    final filePickerDataSource = FilePickerLocalDataSource();
    final fileSplitterDataSource = FileSplitterLocalDataSource();
    _fileRepository =
        FileRepositoryImpl(filePickerDataSource, fileSplitterDataSource);
  }

  Future<void> _pickAndSplitFile() async {
    final filePath = await _fileRepository.pickFile();
    if (filePath != null) {
      final outputDir = '/desired/output/directory'; // Change as needed
      const chunkSizeMB = 100; // Split into 100 MB chunks
      final splitFiles =
          await _fileRepository.splitFile(filePath, chunkSizeMB, outputDir);

      if (splitFiles.isNotEmpty) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File split into ${splitFiles.length} parts')),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File splitting failed!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File Splitter')),
      body: Center(
        child: ElevatedButton(
          onPressed: _pickAndSplitFile,
          child: Text('Pick and Split File'),
        ),
      ),
    );
  }
}

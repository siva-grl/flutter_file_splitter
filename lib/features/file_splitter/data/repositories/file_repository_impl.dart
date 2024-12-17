import '/features/file_splitter/data/datasources/file_picker_local_datasource.dart';
import '/features/file_splitter/data/datasources/file_splitter_local_datasource.dart';
import '/features/file_splitter/domain/repositories/file_repository.dart';

class FileRepositoryImpl extends FileRepository {
  final FilePickerLocalDataSource filePickerDataSource;
  final FileSplitterLocalDataSource fileSplitterDataSource;

  FileRepositoryImpl(this.filePickerDataSource, this.fileSplitterDataSource);

  @override
  Future<String?> pickFile() async {
    return await filePickerDataSource.pickFile();
  }

  @override
  Future<List<String>> splitFile(
      String filePath, int chunkSizeMB, String outputDir) async {
    return await fileSplitterDataSource.splitFile(
        filePath, chunkSizeMB, outputDir);
  }
}

import '../repositories/file_repository.dart';

class SplitFile {
  final FileRepository repository;

  SplitFile(this.repository);

  Future<List<String>> execute(
      String filePath, int chunkSizeMB, String outputDir) async {
    return await repository.splitFile(filePath, chunkSizeMB, outputDir);
  }
}

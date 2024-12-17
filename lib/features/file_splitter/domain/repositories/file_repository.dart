abstract class FileRepository {
  Future<String?> pickFile();
  Future<List<String>> splitFile(
      String filePath, int chunkSizeMB, String outputDir);
}

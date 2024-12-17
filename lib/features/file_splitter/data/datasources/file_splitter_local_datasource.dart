import 'dart:io';

class FileSplitterLocalDataSource {
  Future<List<String>> splitFile(
      String filePath, int chunkSizeMB, String outputDir) async {
    const int bytesPerMB = 1024 * 1024;
    final int chunkSizeBytes = chunkSizeMB * bytesPerMB;
    final file = File(filePath);
    final List<String> chunkPaths = [];

    final stream = file.openRead();
    int chunkIndex = 0;
    int totalBytesRead = 0;

    await for (final chunk in stream) {
      final chunkPath = '$outputDir/chunk_${chunkIndex + 1}.log';
      final chunkFile = File(chunkPath);
      await chunkFile.writeAsBytes(chunk, mode: FileMode.writeOnlyAppend);

      chunkPaths.add(chunkPath);
      totalBytesRead += chunk.length;

      if (totalBytesRead >= chunkSizeBytes) {
        chunkIndex++;
        totalBytesRead = 0;
      }
    }

    return chunkPaths;
  }
}

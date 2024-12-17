import '../repositories/file_repository.dart';

class PickFile {
  final FileRepository repository;

  PickFile(this.repository);

  Future<String?> execute() async {
    return await repository.pickFile();
  }
}

abstract class Failure {
  final String message;
  Failure(this.message);
}

class FilePickFailure extends Failure {
  FilePickFailure(super.message);
}

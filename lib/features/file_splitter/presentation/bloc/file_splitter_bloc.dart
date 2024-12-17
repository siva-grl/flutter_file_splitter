import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FileSplitterEvent {}

class PickFileEvent extends FileSplitterEvent {}

class SplitFileEvent extends FileSplitterEvent {
  final String filePath;
  final int chunkSizeMB;
  final String outputDir;

  SplitFileEvent(this.filePath, this.chunkSizeMB, this.outputDir);
}

abstract class FileSplitterState {}

class FileSplitterInitial extends FileSplitterState {}

class FileSplitterLoading extends FileSplitterState {}

class FileSplitterSuccess extends FileSplitterState {
  final List<String> chunkPaths;
  FileSplitterSuccess(this.chunkPaths);
}

class FileSplitterError extends FileSplitterState {
  final String message;
  FileSplitterError(this.message);
}

class FileSplitterBloc extends Bloc<FileSplitterEvent, FileSplitterState> {
  FileSplitterBloc() : super(FileSplitterInitial()) {
    // Event handling here
  }
}

class FileTooLargeException implements Exception {
  final String message;
  
  const FileTooLargeException(this.message);
  
  @override
  String toString() => 'FileTooLargeException: $message';
}
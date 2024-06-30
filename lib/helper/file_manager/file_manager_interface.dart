abstract interface class FileManagerInterface {
  Future<void> uploadFile(
      String urlUploadEndPoint, {Map<String, String> queryParams});
  Future<void> downloadFile(
      String urlDownloadEndPoint, String fileName,
      {Map<String, String>? queryParams});
}

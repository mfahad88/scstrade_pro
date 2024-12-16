class ApiResponse<T> {
  final Status status;
  final T? data;
  final String? message;

  ApiResponse({required this.status, this.data, this.message});
}

enum Status { loading, completed, error }
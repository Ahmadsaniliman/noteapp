class AppState {
  final bool isLoading;

  AppState({
    required this.isLoading,
  });

  AppState.unKnow() : isLoading = false;

  @override
  String toString() => 'AppState(isLoading: $isLoading)';

  @override
  bool operator ==(covariant AppState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading;
  }

  @override
  int get hashCode => isLoading.hashCode;
}

extension WithNullsRemoved on Map<String, dynamic>? {
  Map<String, dynamic> get withNullsRemoved {
    return Map.fromEntries(
        (this ?? {}).entries.where((entry) => entry.value != null));
  }
}

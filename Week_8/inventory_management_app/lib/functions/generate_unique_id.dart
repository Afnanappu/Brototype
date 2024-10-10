int generateUniqueId() {
  return DateTime.now().millisecondsSinceEpoch % 0xFFFFFFFF;
}

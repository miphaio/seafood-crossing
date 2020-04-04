String getPath() {
  return 'http://localhost:4000';
}

String joinPath(List<String> paths) {
  return getPath() + '/' + paths.join('/');
}

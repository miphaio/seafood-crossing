String getPath() {
  return 'http://10.0.2.2:4000';
}

String joinPath(List<String> paths) {
  return getPath() + '/' + paths.join('/');
}

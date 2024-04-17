extension NonNullString on String?{
  String get orEmpty => this==null ? '' : this!;
}
extension NonNullInt on int?{
  int get orZero => this == null ? 0 : this!;
}
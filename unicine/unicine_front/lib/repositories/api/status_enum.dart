enum StatusEnum {
  success('success'),
  error('error'),
  warning('warning'),
  fatal('fatal');

  final String value;

  const StatusEnum(this.value);
}

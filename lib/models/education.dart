class Education {
  final String description;
  final String linkName;
  final String period;
  final String college;

  const Education({
    required this.description,
    required this.linkName,
    required this.period,
    this.college = '',
  });
}

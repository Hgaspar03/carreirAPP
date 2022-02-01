class WageMapping {
  const WageMapping(this.id, this.index, this.wage);

  final num id;
  final num index;
  final num wage;

  factory WageMapping.fromJson(Map<String, dynamic> jason) {
    return WageMapping(
        jason['id'] as num, jason['index'] as num, jason['wage'] as num);
  }
}

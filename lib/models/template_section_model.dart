class TemplateSectionModel {
  final List<LabelValueItem> items;

  const TemplateSectionModel({required this.items});

  factory TemplateSectionModel.fromJson(Map<String, dynamic> json) {
    final List children = (json['children'] as List?) ?? const [];

    final List data = children.isNotEmpty
        ? (children.first['data'] as List?) ?? const []
        : const [];

    return TemplateSectionModel(
      items: data
          .whereType<Map<String, dynamic>>() // safety
          .map(LabelValueItem.fromJson)
          .toList(),
    );
  }
}

class LabelValueItem {
  final String label;
  final String value;

  const LabelValueItem({
    required this.label,
    required this.value,
  });

  factory LabelValueItem.fromJson(Map<String, dynamic> json) {
    return LabelValueItem(
      label: (json['key'] ?? '').toString(),
      value: (json['value'] ?? '').toString(),
    );
  }
}
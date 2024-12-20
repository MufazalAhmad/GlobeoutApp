class TermsModel {
  final bool accepted;
  final bool aboveAge;

  TermsModel({
    this.accepted = false,
    this.aboveAge = false,
  });

  TermsModel copyWith({
    bool? accepted,
    bool? aboveAge,
  }) {
    return TermsModel(
      accepted: accepted ?? this.accepted,
      aboveAge: aboveAge ?? this.aboveAge,
    );
  }
}

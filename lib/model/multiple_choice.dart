import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'question.dart';

class MultipleChoice extends Question {
  final int answer;
  final List<String> choices;
  final String explanation;
  final int id;
  final String name;
  final String question;
  final String subject;
  final String system;
  final int year;
  MultipleChoice({
    this.answer,
    this.choices,
    this.explanation,
    this.id,
    this.name,
    this.question,
    this.subject,
    this.system,
    this.year,
  }) : super(name: name, id: id, subject: subject, system: system);

  MultipleChoice copyWith({
    int answer,
    List<dynamic> choices,
    String explanation,
    int id,
    String name,
    String question,
    String subject,
    String system,
    int year,
  }) {
    return MultipleChoice(
      answer: answer ?? this.answer,
      choices: choices ?? this.choices,
      explanation: explanation ?? this.explanation,
      id: id ?? this.id,
      name: name ?? this.name,
      question: question ?? this.question,
      subject: subject ?? this.subject,
      system: system ?? this.system,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'choices': choices,
      'explanation': explanation,
      'id': id,
      'name': name,
      'question': question,
      'subject': subject,
      'system': system,
      'year': year,
    };
  }

  factory MultipleChoice.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MultipleChoice(
      answer: map['answer'],
      choices: List<Map<dynamic, dynamic>>.from(map['choices'] ?? [])
          .map((e) => (e['choice'] as String))
          .toList(),
      explanation: map['explanation'],
      id: map['id'],
      name: map['name'],
      question: map['question'],
      subject: map['subject'],
      system: map['system'],
      year: map['year'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MultipleChoice.fromJson(String source) =>
      MultipleChoice.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MultipleChoice(answer: $answer, choices: $choices, explanation: $explanation, id: $id, name: $name, question: $question, subject: $subject, system: $system, year: $year)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MultipleChoice &&
        o.answer == answer &&
        listEquals(o.choices, choices) &&
        o.explanation == explanation &&
        o.id == id &&
        o.name == name &&
        o.question == question &&
        o.subject == subject &&
        o.system == system &&
        o.year == year;
  }

  @override
  int get hashCode {
    return answer.hashCode ^
        choices.hashCode ^
        explanation.hashCode ^
        id.hashCode ^
        name.hashCode ^
        question.hashCode ^
        subject.hashCode ^
        system.hashCode ^
        year.hashCode;
  }

  @override
  String get category => "multipleChoice";
}

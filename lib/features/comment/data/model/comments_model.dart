import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comments_model.g.dart';

@JsonSerializable()
class CommentsModel extends Equatable {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const CommentsModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);

  @override
  List<Object?> get props => [postId, id, name, email, body];
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
class UserModels with _$UserModels{
  const factory UserModels({
    String? age,
    String? email,
    String? firstname,
    String? lastname,
    String? profile,
    String? uid 
  }) = _UserModels;

  factory UserModels.fromJson(Map<String, dynamic> json) => _$UserModelsFromJson(json);
}
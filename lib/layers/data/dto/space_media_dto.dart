import 'package:clean_architecture_app/layers/domain/entities/space_media_entity.dart';

// DTO -> data transfer object
// Responsável por receber o que vem da API e vai devolver para a entidade
class SpaceMediaDto extends SpaceMediaEntity {
  // Extender de SpaceMediaEntity faz com que o DTO seja também um SpaceMediaEntity
  String? date;
  String? explanation;
  String? mediaType;
  String? title;
  String? url;

  SpaceMediaDto({
    required this.date,
    required this.explanation,
    required this.mediaType,
    required this.title,
    required this.url,
  }) : super(
          date: date,
          explanation: explanation,
          mediaType: mediaType,
          title: title,
          url: url,
        );

  static SpaceMediaDto fromJson(Map<dynamic, dynamic> json) {
    return SpaceMediaDto(
      date: json['date'],
      explanation: json['explanation'],
      mediaType: json['media_type'],
      title: json['title'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['explanation'] = this.explanation;
    data['media_type'] = this.mediaType;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

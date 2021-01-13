class QuestionModel {
  String question;
  String reponce_1;
  String reponce_2;
  String reponce_3;
  String reponce_4;
  int bonReponce;
  String info;
  String type;
  String file;
  String image;
  String stage;
  QuestionModel({
    this.question,
    this.reponce_1,
    this.reponce_2,
    this.reponce_3,
    this.reponce_4,
    this.bonReponce,
    this.info,
    this.type,
    this.file,
    this.image,
    this.stage,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        question: json['question'] as String,
        reponce_1: json['reponce 1'] as String,
        reponce_2: json['reponce 2'] as String,
        reponce_3: json['reponce 3'] as String,
        reponce_4: json['reponce 4'] as String,
        bonReponce: json['bon reponce'] as int,
        info: json['info'] as String,
        type: json['type'] as String,
        file: json['file'] as String,
        image: json['image'] as String,
        stage: json['stage'] as String);
  }
}

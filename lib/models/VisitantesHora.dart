class VisitantesHora {
  String? hora_entrada;
  double? qtde;

  VisitantesHora({this.hora_entrada, this.qtde});

  VisitantesHora.fromJson(Map<String, dynamic> json) {
    hora_entrada = json['hora_entrada'];
    qtde = json['qtde'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hora_entrada'] = this.hora_entrada;
    data['qtde'] = this.qtde;
    return data;
  }
}

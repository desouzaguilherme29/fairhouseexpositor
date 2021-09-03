class VisitanteStand {
  String cidade;
  String nome;
  String fantasia;
  String celular;
  String expositor;

  VisitanteStand(
      {this.cidade, this.nome, this.fantasia, this.celular, this.expositor});

  VisitanteStand.fromJson(Map<String, dynamic> json) {
    cidade = json['cidade'];
    nome = json['nome'];
    fantasia = json['fantasia'];
    celular = json['celular'];
    expositor = json['expositor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cidade'] = this.cidade;
    data['nome'] = this.nome;
    data['fantasia'] = this.fantasia;
    data['celular'] = this.celular;
    data['expositor'] = this.expositor;
    return data;
  }
}
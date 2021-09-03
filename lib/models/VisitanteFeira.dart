class VisitanteFeira {
  String cidade;
  String nome;
  String fantasia;
  String celular;

  VisitanteFeira(
      {this.cidade, this.nome, this.fantasia, this.celular});

  VisitanteFeira.fromJson(Map<String, dynamic> json) {
    cidade = json['cidade'];
    nome = json['nome'];
    fantasia = json['fantasia'];
    celular = json['celular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cidade'] = this.cidade;
    data['nome'] = this.nome;
    data['fantasia'] = this.fantasia;
    data['celular'] = this.celular;
    return data;
  }
}
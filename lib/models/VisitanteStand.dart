class VisitanteStand {
  String? cidade;
  String? nome;
  String? email;
  String? tipo;
  String? fantasia;
  String? celular;
  String? celularformatado;
  String? expositor;

  VisitanteStand(
      {this.cidade, this.nome, this.email, this.tipo, this.fantasia, this.celular,this.celularformatado, this.expositor});

  VisitanteStand.fromJson(Map<String, dynamic> json) {
    cidade = json['cidade'];
    nome = json['nome'];
    email = json['email'];
    tipo = json['tipo'];
    fantasia = json['fantasia'];
    celular = json['celular'];
    celularformatado = json['celularformatado'];
    expositor = json['expositor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cidade'] = this.cidade;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['tipo'] = this.tipo;
    data['fantasia'] = this.fantasia;
    data['celular'] = this.celular;
    data['celularformatado'] = this.celularformatado;
    data['expositor'] = this.expositor;
    return data;
  }
}

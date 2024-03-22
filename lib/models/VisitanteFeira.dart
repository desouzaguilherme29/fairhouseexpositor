class VisitanteFeira {
  String? cidade;
  String? nome;
  String? email;
  String? fantasia;
  String? celular;
  String? celularformatado;
  String? tipo;

  VisitanteFeira({this.cidade, this.nome, this.email, this.fantasia, this.celular, this.celularformatado, this.tipo});

  VisitanteFeira.fromJson(Map<String, dynamic> json) {
    cidade = json['cidade'];
    nome = json['nome'];
    email = json['email'];
    fantasia = json['fantasia'];
    celular = json['celular'];
    celularformatado = json['celularformatado'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cidade'] = this.cidade;
    data['nome'] = this.nome;
    data['fantasia'] = this.fantasia;
    data['celular'] = this.celular;
    data['celularformatado'] = this.celularformatado;
    data['email'] = this.email;
    data['tipo'] = this.tipo;
    return data;
  }
}

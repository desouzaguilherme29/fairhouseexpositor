class Usuario {
  int? id;
  String? nome;
  String? razaosocial;
  String? cnpj;
  String? cidade;
  String? email;
  String? telefone;
  String? pais;
  bool? tpAtivo;
  String? datacadastro;
  String? login;
  String? senha;

  Usuario(
      {this.id,
      this.nome,
      this.razaosocial,
      this.cnpj,
      this.cidade,
      this.email,
      this.telefone,
      this.pais,
      this.tpAtivo,
      this.datacadastro,
      this.login,
      this.senha});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nome: json['nome'],
      razaosocial: json['razaosocial'],
      cnpj: json['cnpj'],
      cidade: json['cidade'],
      email: json['email'],
      telefone: json['telefone'],
      pais: json['pais'],
      tpAtivo: json['tp_ativo'],
      datacadastro: json['datacadastro'],
      login: json['login'],
      senha: json['senha'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['razaosocial'] = this.razaosocial;
    data['cnpj'] = this.cnpj;
    data['cidade'] = this.cidade;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    data['pais'] = this.pais;
    data['tp_ativo'] = this.tpAtivo;
    data['datacadastro'] = this.datacadastro;
    data['login'] = this.login;
    data['senha'] = this.senha;
    return data;
  }

  @override
  String toString() {
    return 'Código: $id, Nome: $nome, CNPJ: $cnpj, Cidade: $cidade, Email $email, Telefone: $telefone, Cidade: $cidade, Usuario: $login, Senha: $senha';
  }
}

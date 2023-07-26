class DadosLogin {
  String? token;
  String? refreshToken;
  Expositor? expositor;
  Evento? evento;

  DadosLogin({this.token, this.refreshToken, this.expositor, this.evento});

  DadosLogin.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    refreshToken = json['RefreshToken'];
    expositor = json['Expositor'] != null
        ? new Expositor.fromJson(json['Expositor'])
        : null;
    evento =
        json['Evento'] != null ? new Evento.fromJson(json['Evento']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    data['RefreshToken'] = this.refreshToken;
    if (this.expositor != null) {
      data['Expositor'] = this.expositor!.toJson();
    }
    if (this.evento != null) {
      data['Evento'] = this.evento!.toJson();
    }
    return data;
  }
}

class Expositor {
  int? id;
  String? nome;
  String? razaosocial;
  String? cnpj;
  int? cidadeid;
  String? cidade;
  String? email;
  String? telefone;
  String? pais;
  bool? tpAtivo;
  String? datacadastro;
  String? login;
  String? senha;

  Expositor(
      {this.id,
      this.nome,
      this.razaosocial,
      this.cnpj,
      this.cidadeid,
      this.cidade,
      this.email,
      this.telefone,
      this.pais,
      this.tpAtivo,
      this.datacadastro,
      this.login,
      this.senha});

  Expositor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    razaosocial = json['razaosocial'];
    cnpj = json['cnpj'];
    cidadeid = json['cidadeid'];
    cidade = json['cidade'];
    email = json['email'];
    telefone = json['telefone'];
    pais = json['pais'];
    tpAtivo = json['tp_ativo'];
    datacadastro = json['datacadastro'];
    login = json['login'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['razaosocial'] = this.razaosocial;
    data['cnpj'] = this.cnpj;
    data['cidadeid'] = this.cidadeid;
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
}

class Evento {
  int? empresaid;
  String? nome;
  String? datainicio;
  String? datafim;
  int? cidadeid;
  String? cidade;
  String? estado;
  int? ativo;

  Evento(
      {this.empresaid,
      this.nome,
      this.datainicio,
      this.datafim,
      this.cidadeid,
      this.cidade,
      this.estado,
      this.ativo});

  Evento.fromJson(Map<String, dynamic> json) {
    empresaid = json['empresaid'];
    nome = json['nome'];
    datainicio = json['datainicio'];
    datafim = json['datafim'];
    cidadeid = json['cidadeid'];
    cidade = json['cidade'];
    estado = json['estado'];
    ativo = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empresaid'] = this.empresaid;
    data['nome'] = this.nome;
    data['datainicio'] = this.datainicio;
    data['datafim'] = this.datafim;
    data['cidadeid'] = this.cidadeid;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['ativo'] = this.ativo;
    return data;
  }
}

class Visitante {
  int id;
  String nome;
  String razaosocial;
  String cnpj;
  String cidade;
  String email;
  String telefone;
  String tipo;
  String pais;
  bool tpLiberadoAcesso;
  String foto;
  String datacadastro;
  bool tpEmail;
  bool tpEtiqueta;
  bool tpEntrada;
  String celular;
  String cpf;
  String fantasia;
  String evento;
  int idMovPortaria;

  Visitante(
      {this.id,
      this.nome,
      this.razaosocial,
      this.cnpj,
      this.cidade,
      this.email,
      this.telefone,
      this.tipo,
      this.pais,
      this.tpLiberadoAcesso,
      this.foto,
      this.datacadastro,
      this.tpEmail,
      this.tpEtiqueta,
      this.tpEntrada,
      this.celular,
      this.cpf,
      this.fantasia,
      this.evento,
      this.idMovPortaria});

  Visitante.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    razaosocial = json['razaosocial'];
    cnpj = json['cnpj'];
    cidade = json['cidade'];
    email = json['email'];
    telefone = json['telefone'];
    tipo = json['tipo'];
    pais = json['pais'];
    tpLiberadoAcesso = json['tp_liberado_acesso'];
    foto = json['foto'];
    datacadastro = json['datacadastro'];
    tpEmail = json['tp_email'];
    tpEtiqueta = json['tp_etiqueta'];
    tpEntrada = json['tp_entrada'];
    celular = json['celular'];
    cpf = json['cpf'];
    fantasia = json['fantasia'];
    evento = json['evento'];
    idMovPortaria = json['id_mov_portaria'];
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
    data['tipo'] = this.tipo;
    data['pais'] = this.pais;
    data['tp_liberado_acesso'] = this.tpLiberadoAcesso;
    data['foto'] = this.foto;
    data['datacadastro'] = this.datacadastro;
    data['tp_email'] = this.tpEmail;
    data['tp_etiqueta'] = this.tpEtiqueta;
    data['tp_entrada'] = this.tpEntrada;
    data['celular'] = this.celular;
    data['cpf'] = this.cpf;
    data['fantasia'] = this.fantasia;
    data['evento'] = this.evento;
    data['id_mov_portaria'] = this.idMovPortaria;
    return data;
  }
}

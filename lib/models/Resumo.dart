class Resumo {
  int visitandoAgora;
  int jaPassaramPeloEvento;
  int pessoasVisitaramSeuStand;
  int cadastrados;

  Resumo(
      {this.visitandoAgora,
      this.jaPassaramPeloEvento,
      this.pessoasVisitaramSeuStand,
      this.cadastrados});

  Resumo.fromJson(Map<String, dynamic> json) {
    visitandoAgora = json['visitando_agora'];
    jaPassaramPeloEvento = json['ja_passaram_pelo_evento'];
    pessoasVisitaramSeuStand = json['pessoas_visitaram_seu_stand'];
    cadastrados = json['cadastrados'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visitando_agora'] = this.visitandoAgora;
    data['ja_passaram_pelo_evento'] = this.jaPassaramPeloEvento;
    data['pessoas_visitaram_seu_stand'] = this.pessoasVisitaramSeuStand;
    data['cadastrados'] = this.cadastrados;
    return data;
  }
}

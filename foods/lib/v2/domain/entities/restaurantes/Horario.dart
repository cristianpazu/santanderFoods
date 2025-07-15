class Horario {
  String? lunes;
  String? martes;
  String? miercoles;
  String? jueves;
  String? viernes;
  String? sabado;
  String? domingo;

  Horario({
    this.lunes,
    this.martes,
    this.miercoles,
    this.jueves,
    this.viernes,
    this.sabado,
    this.domingo,
  });

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        lunes: json["Lunes"],
        martes: json["Martes"],
        miercoles: json["Miercoles"],
        jueves: json["Jueves"],
        viernes: json["Viernes"],
        sabado: json["Sabado"],
        domingo: json["Domingo"],
      );

  Map<String, dynamic> toJson() => {
        "Lunes": lunes,
        "Martes": martes,
        "Miercoles": miercoles,
        "Jueves": jueves,
        "Viernes": viernes,
        "Sabado": sabado,
        "Domingo": domingo,
      };

  Horario copyWith({
    String? lunes,
    String? martes,
    String? miercoles,
    String? jueves,
    String? viernes,
    String? sabado,
    String? domingo,
  }) =>
      Horario(
lunes: lunes ?? this.lunes,
martes: martes  ?? this.martes,
miercoles: miercoles ?? this.miercoles,
jueves:jueves ?? this.jueves,
viernes:viernes ?? this. viernes,
sabado:sabado?? this. sabado,
domingo:domingo?? this. domingo,
      );
}

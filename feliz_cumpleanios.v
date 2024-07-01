module feliz_cumpleanios(
    input wire clk,
    output wire altavoz
);
    wire siguiente_nota;
    wire [9:0] melodia;
    wire salida_parlante;

    controlador_de_tiempo divisor(
        .clk_divisor(clk),
        .cambiar_nota(siguiente_nota)
    );

    generador_de_melodia melodia_secuencia(
        .clk_nota(siguiente_nota),
        .frecuencia(melodia)
    );

    generador_de_frecuencia salida_tono(
        .clk_periodo(clk),
        .tono(melodia),
        .onda_cuadrada(salida_parlante)
    );

    assign altavoz = salida_parlante;
endmodule
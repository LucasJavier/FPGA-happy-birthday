`define generador_dumpfile(nombreArchivo) `"nombreArchivo`"
`timescale 1 ns / 1 ps

module generador_de_melodia_tb();

reg t_clk_controlador = 0;
wire t_cambiar_nota;
wire [9:0] t_frecuencia;

controlador_de_tiempo UUT_CT(
    .clk_divisor(t_clk_controlador),
    .cambiar_nota(t_cambiar_nota)
);

generador_de_melodia UUT_GM(
    .clk_nota(t_cambiar_nota),
    .frecuencia(t_frecuencia)
);

always #416 t_clk_controlador = ~t_clk_controlador;

initial begin
    
    $dumpfile(`generador_dumpfile(`VCD_OUTPUT));
    $dumpvars(0,generador_de_melodia_tb);
    #25000000000
    $finish;

end

endmodule
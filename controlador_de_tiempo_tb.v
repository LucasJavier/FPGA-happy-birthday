`define generador_dumpfile(nombreArchivo) `"nombreArchivo.vcd`"
`timescale 1 ns / 1 ps

module controlador_de_tiempo_tb();

reg t_clk = 0;
wire t_cambiar_nota;

controlador_de_tiempo UUT(
    .clk_divisor(t_clk),
    .cambiar_nota(t_cambiar_nota)
);

always #416 t_clk = ~t_clk;

initial begin
    
    $dumpfile(`generador_dumpfile(`VCD_OUTPUT));
    $dumpvars(0,controlador_de_tiempo_tb);
    #25000000000
    $finish;

end

endmodule

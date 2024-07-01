`define generador_dumpfile(nombreArchivo) `"nombreArchivo`"
`timescale 1 ns / 1 ps

module feliz_cumpleanios_tb();

reg t_clk = 0;
wire t_altavoz;

feliz_cumpleanios UUT_FC(
    .clk(t_clk),
    .altavoz(t_altavoz)
);

always #416 t_clk = ~t_clk; 

initial begin

    $dumpfile(`generador_dumpfile(`VCD_OUTPUT));
    $dumpvars(0,feliz_cumpleanios_tb);
    #25000000000
    $finish;

end

endmodule
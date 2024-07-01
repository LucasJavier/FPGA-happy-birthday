module controlador_de_tiempo(
    input wire clk_divisor,
    output reg cambiar_nota
);

    initial cambiar_nota = 0;

    localparam [22:0] tiempo = 1500000;
    reg [22:0] contador = 0;

    always @(posedge clk_divisor) begin
        if (contador >= tiempo) begin
            contador <= 0;
            cambiar_nota <= ~cambiar_nota;
        end else begin
            contador <= contador + 1;
        end
    end

endmodule
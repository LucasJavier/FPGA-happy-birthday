module generador_de_frecuencia(
    input wire clk_periodo,
    input wire [9:0] tono,
    output reg onda_cuadrada
);

    initial onda_cuadrada = 0;

    reg [14:0] contador = 0;
    reg [14:0] mitad_periodo;

    always @(posedge clk_periodo) begin
        mitad_periodo = 12000000 / (tono * 2); 
        if (contador >= mitad_periodo) begin
            contador <= 0;
            onda_cuadrada <= ~onda_cuadrada;
        end else begin
            contador <= contador + 1;
        end
    end
endmodule
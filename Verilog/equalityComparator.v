// -------------------------
// Exemplo_0803 - EQUALITY COMPARATOR
// Nome: David Freitas Marzola
// Matricula: ######
// -------------------------
//  Equality Comparator
// -------------------------
module EqualityComparator (output s0,input a, input b);
// descrever por portas e/ou modulos
// (valores arbitrarios escolhidos apenas para exemplo)
wire entrada_1;
wire entrada_2;
wire saida;

assign s0 = ~(a^b) ;//borrow_out

endmodule // EqualityComparator
module test_EqualityComparator;
// ------------------------- definir dados
reg  [4:0] x;
reg  [4:0] y;
wire [4:0] saida;
EqualityComparator EC0(saida[0],x[0],y[0]);//("vem-um inicial arbitrário")
EqualityComparator EC1(saida[1],x[1],y[1]);
EqualityComparator EC2(saida[2],x[2],y[2]);
EqualityComparator EC3(saida[3],x[3],y[3]);
EqualityComparator EC4(saida[4],x[4],y[4]);

initial
begin : main
$display("Exemplo_0803 - David Freitas Marzola - 712325");
$display("Test ALU’s Equality Comparator");
$display("  x   y  saida");
#1 x = 5'b00000; y = 5'b00000;
// projetar testes do modulo
//
#1 $monitor("%5b %5b %5b", x, y, saida);//entradas de 4 bits
#1 x = 5'b10101; y = 5'b01010;
#1 x = 5'b00011; y = 5'b01010;
#1 x = 5'b00100; y = 5'b01011;

end
endmodule // test_fullSubtractor

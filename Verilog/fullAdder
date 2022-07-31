// -------------------------
// Exemplo_0801 -FULL ADDER
// Nome: David Freitas Marzola
// Matricula: ######
//-------------------------
// -------------------------
//  half adder
/*a   b   s  carry
  0 + 0   0 > 0
  0 + 1   1 > 0
  1 + 0   1 > 0
  1 + 1   0 > 1  
  s = xor, carry = and*/
// -------------------------
module halfAdder (output s1,output s0, input     a, input     b);
// descrever por portas
xor XOR1 ( s0, b, a );//s0 = soma
//assign s0 = b ^ a;
and AND1 ( s1, a, b );//s1 = carry = "vai um"
//assign s1 = a & b;
endmodule // halfAdder
// -------------------------
//  full adder
// -------------------------
module fullAdder (output s1,output s0,input a, input b, input carry_in);
// descrever por portas e/ou modulos
// (valores arbitrarios escolhidos apenas para exemplo)
wire carry_out;
wire carry_out2;
wire soma;
halfAdder HA0(carry_out,soma,a,b);

halfAdder HA1(carry_out2,s0,soma,carry_in);
assign s1 = carry_out2 | carry_out;

endmodule // fullAdder
module test_fullAdder;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [3:0] carry; // “vai-um”
wire [4:0] soma;
// halfAdder HA0 ( carry[0], soma[0], x[0], y[0] );
fullAdder FA0(carry[0],soma[0],x[0],y[0], 1'b0);
fullAdder FA1(carry[1],soma[1],x[1], y[1], carry[0]);
fullAdder FA2(carry[2],soma[2],x[2], y[2], carry[1]);
fullAdder FA3(carry[3],soma[3],x[3], y[3], carry[2]);
//fullAdder FA4(carry0,soma[4],x[3], y[3], carry1);// "vai-um" ocupa uma posi-
//ção a mais: "1+1+1 = 1 e vai um"
assign soma[4] = 1'b0 | carry[3];//"vai-um final"

initial
begin : main
$display("Exemplo_0801 - David Freitas Marzola - 712325");
$display("Test ALU’s full adder");
$display("  x    y  soma  carry");
#1 x = 4'b0000; y = 4'b0000;
// projetar testes do modulo
//
#1 $monitor("%1b %1b %1b %1b", x, y, soma, carry);//entradas de 4 bits
#1 x = 4'b0000; y = 4'b0001;
#1 x = 4'b0001; y = 4'b0010;
#1 x = 4'b0010; y = 4'b0011;
#1 x = 4'b0011; y = 4'b0100;
#1 x = 4'b0100; y = 4'b0101;
#1 x = 4'b0101; y = 4'b0110;
#1 x = 4'b0110; y = 4'b0111;
#1 x = 4'b0111; y = 4'b1000;
#1 x = 4'b1000; y = 4'b1001;
#1 x = 4'b1001; y = 4'b1010;
#1 x = 4'b1010; y = 4'b1011;
#1 x = 4'b1011; y = 4'b1100;
#1 x = 4'b1100; y = 4'b1101;
#1 x = 4'b1101; y = 4'b1110;
#1 x = 4'b1110; y = 4'b1111;
end
endmodule // test_fullAdder 

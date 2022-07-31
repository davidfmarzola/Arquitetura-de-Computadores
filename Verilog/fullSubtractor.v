// -------------------------
// Exemplo_0802 -FULL SUBTRACTOR
// Nome: David Freitas Marzola
// Matricula: ######
//-------------------------
// -------------------------
//  half subtractor
/*a   b   s  borrow
  0 + 0   0 > 0
  0 + 1   1 > 1
  1 + 0   1 > 0
  1 + 1   0 > 0  
  s = xor, borrow = a'.b*/
// -------------------------
module halfSubtractor (output s1,output s0, input     a, input     b);
// descrever por portas
assign s0 = (a ^ b);//s0 = subtracao ("diff")
//and AND1 ( s1, not_a, b );
assign s1 = ~a & b;//s1 = borrow_out ("vem-um")
endmodule // halfSubtractor
// -------------------------
//  full subtractor
// -------------------------
module fullSubtractor (output s1,output s0,input a, input b, input borrow_in);
// descrever por portas e/ou modulos
// (valores arbitrarios escolhidos apenas para exemplo)
wire borrow_out;
wire borrow_out2;
wire subtracao;
halfSubtractor HS0(borrow_out,subtracao,a,b);
assign s0 = (a ^ b) ^ borrow_in;//subtracao (diff)
halfSubtractor HS1(borrow_out2,s0,subtracao,borrow_in);
assign s1 = (b & borrow_in) + (~a & borrow_in) + (~a & b);//borrow_out

endmodule // fullSubtractor
module test_fullSubtractor;
// ------------------------- definir dados
reg [4:0] x;
reg [4:0] y;
wire [4:0] borrow_out; // “vem-um”
wire [5:0] subtracao;
// halfSubtractor HA0 ( borrow_out, subtracao, x, y );
fullSubtractor FA0(borrow_out[0],subtracao[0],x[0],y[0], 1'b0);//("vem-um inicial arbitrário")
fullSubtractor FA1(borrow_out[1],subtracao[1],x[1], y[1], borrow_out[0]);
fullSubtractor FA2(borrow_out[2],subtracao[2],x[2], y[2], borrow_out[1]);
fullSubtractor FA3(borrow_out[3],subtracao[3],x[3], y[3], borrow_out[2]);
fullSubtractor FA4(borrow_out[4],subtracao[4],x[4], y[4], borrow_out[3]);// "vai-um" ocupa uma posi-
// //ção a mais: "1+1+1 = 1 e vai um"
assign subtracao[5] = 1'b0 | borrow_out[4];//"vai-um final"

initial
begin : main
$display("Exemplo_0802 - David Freitas Marzola - 712325");
$display("Test ALU’s full subtractor");
$display("  x   y  subtracao  borrow_out");
#1 x = 5'b00000; y = 5'b00000;
// projetar testes do modulo
//
#1 $monitor("%5b %5b %5b %5b", x, y, subtracao, borrow_out);//entradas de 4 bits
#1 x = 5'b10101; y = 5'b01010;
#1 x = 5'b00011; y = 5'b01010;
#1 x = 5'b00100; y = 5'b01011;

end
endmodule // test_fullSubtractor

// Variavel 'p' metade da frequencia do clock = 'p' com metade do tempo do clock em segundos
// ---------------------------
// -- test clock generator (4)
// ---------------------------
`include "clock.v"
module pulse ( signal, clock );
    input clock;
    output signal;
    reg signal;

    always @ ( posedge clock )
    begin
        signal = 1'b1;
        #6 signal = 1'b0;// o '#numero' equivale a frequencia do pulso
        #6 signal = 1'b1;
        #6 signal = 1'b0;
        #6 signal = 1'b1;
        #6 signal = 1'b0;
    end
endmodule // pulse

module PulseGenerator;

    wire clock;
    clock clk ( clock );
    wire p;
    pulse pls( p, clock );

    initial begin
        $dumpfile ( "PulseGenerator.vcd" );
        $dumpvars ( 1, clock, p );

        #480 $finish;
    end

endmodule // PulseGenerator


`timescale 10ns/1ns
module clockgen (clock); 
output reg clock;
initial
begin
clock=0;
end 
always 
begin
#62.5 clock=1;
#62.5 clock=0;
end
endmodule 

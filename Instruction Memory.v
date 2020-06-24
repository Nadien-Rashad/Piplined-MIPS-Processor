
module instmem(pcc,inst,clk);
input clk;
input [31:0] pcc;
output reg[31:0] inst;
reg[31:0] instfile[0:8191];
initial
$readmemb("E:\Verilog/MyMemoryFile.txt",  instfile);
always@(pcc)
begin
assign inst=instfile[pcc];
end
endmodule

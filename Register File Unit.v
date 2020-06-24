module regfile(clock,addr1,addr2,read1,read2,writereg,writedata,write);

input[4:0] addr1,addr2,writereg;
input[31:0] writedata;
input write,clock;

output[31:0] read1,read2;
integer k;
reg[31:0]regbank[0:31];

initial
begin
for(k=0;k<32;k=k+1)
regbank[k]=k;
end

assign read1=regbank[addr1];
assign read2=regbank[addr2];


always@(posedge clock)
begin
if(write==1 && writereg != 0)
 regbank[writereg]<=writedata;

end

endmodule

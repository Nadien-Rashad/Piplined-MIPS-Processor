

module Data_Memory(address,write_data,read_data,mem_write,mem_read,clock);
input[31:0] address,write_data;
output reg[31:0]read_data;
input clock,mem_read,mem_write;

integer i;
reg [31:0] RAM_mem[0:8191]; //array of registers
wire[31:0] RAM_address=address; //el RAM_address de ttwsl b el ALU result
initial
begin
for(i=0;i<8191;i=i+1)
RAM_mem[i]<=i;
end


always@(posedge clock)
begin
if(mem_write)
RAM_mem[RAM_address]<=write_data;
end

always @(mem_read)
begin
if(mem_read)
read_data<=RAM_mem[RAM_address];
else 
read_data<=32'hxxxxxxxx;
end
endmodule




module spiwrapper_tb();

parameter IDLE      = 3'b 000;
parameter CHK_CMD   = 3'b 001;
parameter WRITE     = 3'b 010;
parameter READ_ADD  = 3'b 011;
parameter READ_DATA = 3'b 100;
parameter MEM_DEPTH = 256;
parameter ADDR_SIZE = 8;

reg  MOSI,SS_n,clk,rst_n;
wire MISO;
spi_wrapper #(.MEM_DEPTH(MEM_DEPTH),.ADDR_SIZE(ADDR_SIZE))DUT(MISO,MOSI,SS_n,clk,rst_n);

initial begin
    clk =0;
    forever
     #1 clk =~clk;
end

initial begin
$readmemh("mem.dat", DUT.RAM.mem);
rst_n =0;
SS_n = 0;
MOSI = 0;
@(negedge clk);
rst_n =1;
// check write adress 256
SS_n = 0;
@(negedge clk)
SS_n =0;
MOSI =0;
@(negedge clk);
MOSI =0;
@(negedge clk);
MOSI =0;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
SS_n =1;
@(negedge clk);

// check write data on address 256
SS_n = 0;
@(negedge clk)
SS_n =0;
MOSI =0;
@(negedge clk);
MOSI =0;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =0;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =0;
SS_n =1;
@(negedge clk);

// check read address 256

SS_n = 0;
@(negedge clk)
SS_n =0;
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =0;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
SS_n =1;
@(negedge clk);

// check read data 256
SS_n = 0;
@(negedge clk)
SS_n =0;
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
MOSI =1;
@(negedge clk);
SS_n =1;
@(negedge clk);


$stop;
end
endmodule
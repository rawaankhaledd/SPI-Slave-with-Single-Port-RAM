module spr_sync(clk,rst_n,din,rx_valid,dout,tx_valid);

parameter MEM_DEPTH = 256;
parameter ADDR_SIZE = 8;

input clk,rst_n;
input [9:0] din;
input rx_valid;
output reg [7:0] dout;
output reg tx_valid;
reg [ADDR_SIZE -1 :0] temp;
reg [7:0] mem [MEM_DEPTH-1 :0];

always @(posedge clk ) begin
    if(~rst_n) begin
        dout <= 0;
        tx_valid <= 0;
    end
    else if (rx_valid) begin
        
      case(din[9:8])
       2'b 00 : begin
                  temp <= din[7:0];
                  tx_valid <= 0;
                end
       2'b 01 :  begin
                  mem[temp] <= din [7:0];
                  tx_valid <= 0;
                end
                
       2'b 10 : begin
                  temp <= din[7:0];
                  tx_valid <= 0;
                end
       
       

                 
        default : begin
                   dout <= mem[temp];
                   tx_valid <= 1;
                  end

                     
       endcase

      end
      else begin
       if (din[9:8] == 2'b11) begin
          dout <= mem[temp];
          tx_valid <= 1;
      end
      end
end

endmodule



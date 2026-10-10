module spi_slave(MOSI,MISO,SS_n,clk,rst_n,rx_data,rx_valid,tx_data,tx_valid);

parameter IDLE      = 3'b 000;
parameter CHK_CMD   = 3'b 001;
parameter WRITE     = 3'b 010;
parameter READ_ADD  = 3'b 011;
parameter READ_DATA = 3'b 100;

input MOSI,SS_n,clk,rst_n,tx_valid;
input [7:0] tx_data;
output reg MISO,rx_valid;
output reg [9:0] rx_data;
reg [3:0]counter;
reg [2:0] counter_readdata;
reg add_data;
reg [9:0] store;
(* fsm_encoding = "sequential"*)
reg [2:0] cs,ns;


//State Memory
always@(posedge clk) begin
    if(~rst_n) begin
     cs <= IDLE;

    end
    else
      cs <= ns;
end

//Next state logic
always@(*) begin
    case(cs) 
    IDLE:
        begin
            if(SS_n == 0) 
               ns = CHK_CMD;
           else
               ns = IDLE;
        end
    CHK_CMD :
        begin
           if(SS_n == 0) begin
               if(MOSI == 0)
                ns = WRITE;
               else begin
                   if(add_data == 0)
                     ns = READ_ADD;
                   else
                     ns = READ_DATA;  
               end
           end
           else
               ns = IDLE; 
        end    
    WRITE:
           if(SS_n == 0) 
              ns = WRITE;
           else
              ns = IDLE;
    READ_ADD:  
            if(SS_n == 0) 
              ns = READ_ADD;
           else
              ns = IDLE;        
    READ_DATA:  
            if(SS_n == 0) 
              ns = READ_DATA;
           else
              ns = IDLE;    

    default : ns = IDLE;
    endcase
end

//output logic
always@(posedge clk) begin
    if(~rst_n) begin
     MISO     <= 0;
     rx_data  <= 0;
     rx_valid <= 0;
    end
    else
    case(cs)
      IDLE:
        begin
            counter  <= 9;
            MISO     <= 0;
            rx_data  <= 0;
            rx_valid <= 0;
            counter_readdata <= 7;
        end 
    WRITE: begin
          
             rx_data[counter] <= MOSI;
             counter <= counter - 1;

              if(counter == 0) begin
        
                rx_valid <= 1;
             end
    end
        
    READ_ADD:  begin
        
             rx_data[counter] <= MOSI;
             counter <= counter - 1;

              if(counter == 0) begin
        
               
               rx_valid <= 1;
               add_data <= 1;
             end
    end
                       
    READ_DATA: begin
                 rx_data[counter] <= MOSI;
                  counter <= counter - 1;
             if(tx_valid == 1) begin

               MISO <= tx_data[counter_readdata];
               counter_readdata <= counter_readdata - 1;
              if(counter_readdata == 0)
               add_data <= 0;
            
            end  
    end
    default :begin
             counter  <= 9;
             MISO     <= 0;
             rx_data  <= 0;
             rx_valid <= 0;
             counter_readdata <= 7;
              end

endcase
      
end
endmodule







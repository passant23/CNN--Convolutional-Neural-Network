`timescale 1ns / 1ps

module Conv1F_tb;
// Setting the clock //
localparam Period = 0.1; 
reg [31:0] Imagein [32][32];
reg [31:0] tempImage [32][32];
reg clk,start;
reg [31:0] Filt [5][5];
wire [31:0] Imageout [28][28];

assign tempImage[0][0]=32'b00111111100000000000000000000000; assign tempImage[0][1]=32'b00111111100000000000000000000000;
assign tempImage[0][2]=32'b00111111100000000000000000000000; assign tempImage[0][3]=32'b00111111100000000000000000000000;
assign tempImage[0][4]=32'b00111111100000000000000000000000;

assign tempImage[1][0]=32'b00111111100000000000000000000000; assign tempImage[1][1]=32'b00111111100000000000000000000000;
assign tempImage[1][2]=32'b00111111100000000000000000000000; assign tempImage[1][3]=32'b00111111100000000000000000000000;
assign tempImage[1][4]=32'b00111111100000000000000000000000;

assign tempImage[2][0]=32'b00111111100000000000000000000000;  assign tempImage[2][1]=32'b01000000000000000000000000000000;
assign tempImage[2][2]=32'b01000000010000000000000000000000;  assign tempImage[2][3]=32'b01000000100000000000000000000000;
assign tempImage[2][4]=32'b01000001011100000000000000000000;

assign tempImage[3][0]=32'b01000000101000000000000000000000;  assign tempImage[3][1]=32'b01000000110000000000000000000000;
assign tempImage[3][2]=32'b01000000111000000000000000000000;  assign tempImage[3][3]=32'b01000001000000000000000000000000;
assign tempImage[3][4]=32'b01000001000100000000000000000000; 
 
assign tempImage[4][0]=32'b01000001001000000000000000000000;
assign tempImage[4][1]=32'b01000001001100000000000000000000;  assign tempImage[4][2]=32'b01000001010000000000000000000000;
assign tempImage[4][3]=32'b01000001010100000000000000000000; assign tempImage[4][4]=32'b01000001011000000000000000000000;

assign tempImage[5][0]=32'b01000001011100000000000000000000; assign tempImage[5][1]=32'b01000001100000000000000000000000;
assign tempImage[5][2]=32'b01000001011100000000000000000000; assign tempImage[5][3]=32'b01000001100000000000000000000000;
assign tempImage[5][4]=32'b01000001011100000000000000000000; 

assign tempImage[6][0]=32'b01000001100000000000000000000000;
assign tempImage[6][1]=32'b01000001011100000000000000000000; assign tempImage[6][2]=32'b01000001100000000000000000000000;
assign tempImage[6][3]=32'b01000001011100000000000000000000; assign tempImage[6][4]=32'b01000001100000000000000000000000;

assign Filt [0][0]=32'b00111111100000000000000000000000;  assign Filt[0][1]=32'b01000000000000000000000000000000;
assign Filt [0][2]=32'b01000000010000000000000000000000;  assign Filt[0][3]=32'b01000000100000000000000000000000;
assign Filt[0][4]=32'b01000001011100000000000000000000;
assign Filt[1][0]=32'b01000000101000000000000000000000;  assign Filt[1][1]=32'b01000000110000000000000000000000;
assign Filt[1][2]=32'b01000000111000000000000000000000;  assign Filt[1][3]=32'b01000001000000000000000000000000;
assign Filt[1][4]=32'b01000001000100000000000000000000;  assign Filt[2][0]=32'b01000001001000000000000000000000;
assign Filt[2][1]=32'b01000001001100000000000000000000;  assign Filt[2][2]=32'b01000001010000000000000000000000;
assign Filt[2][3]=32'b01000001010100000000000000000000; assign Filt[2][4]=32'b01000001011000000000000000000000;
assign Filt[3][0]=32'b01000001011100000000000000000000; assign Filt[3][1]=32'b01000001100000000000000000000000;
assign Filt[3][2]=32'b01000001011100000000000000000000; assign Filt[3][3]=32'b01000001100000000000000000000000;
assign Filt[3][4]=32'b01000001011100000000000000000000; assign Filt[4][0]=32'b01000001100000000000000000000000;
assign Filt[4][1]=32'b01000001011100000000000000000000; assign Filt[4][2]=32'b01000001100000000000000000000000;
assign Filt[4][3]=32'b01000001011100000000000000000000; assign Filt[4][4]=32'b01000001100000000000000000000000;


Conv1F conv(
.Image(Imagein),
.Filter(Filt),
.start(start),
.clk(clk),
.Out(Imageout)
);
      always
      begin
      #(Period/2) clk = ~clk;
      end
initial
begin
start=0;
clk=0;
//#(Period/2) //  1st Rising edge: Assign pixel of image
Imagein=tempImage; 
#Period // Next Falling edge
start=1;
$stop;
end



endmodule
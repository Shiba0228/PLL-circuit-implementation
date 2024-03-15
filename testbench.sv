`timescale 1ns/10ps
module testbench;

	logic refclk,rst,outclk_0,outclk_1,locked; //I/0 declcaration
	

pll pll(                                      //load pll module
	.refclk(refclk),
	.rst(rst),
	.outclk_0(outclk_0),
	.outclk_1(outclk_1),
	.locked(locked)
);

always #10 refclk = ~refclk;          //input refclock, change polar per 10ns
	initial begin
		refclk = 0;                  //initialzation
		rst = 1;                     //initial value of reset is 1, (do not clear to zero)
		#10 rst = 0;                 //clear to zero
		#1000 $stop;                 //stop
	end
endmodule
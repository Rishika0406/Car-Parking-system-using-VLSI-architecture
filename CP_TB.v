`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////

module CP_TB;

	// Inputs
	reg clk=0;
	reg rst=1;
	reg sn;
	reg gL;
	reg rL;

	// Outputs
	wire [1:0] status;

	// Instantiate the Unit Under Test (UUT)
	CAR_PARKING_PROPOSED uut (
		.clk(clk), 
		.rst(rst), 
		.sn(sn), 
		.gL(gL), 
		.rL(rL), 
		.status(status)
	);

	always #5 clk = !clk ;
	initial begin
		// Initialize Inputs
		@(negedge clk);
		rst = 0;
		sn = 0;
		gL = 0;
		rL = 0;
		$display("ideal position ");
		@(negedge clk);
		@(negedge clk);
		sn = 1;
		gL = 0;
		rL = 0;
		$display("gate is opening now ");
		@(negedge clk);
		@(negedge clk);
		sn = 0;
		gL = 1;
		rL = 0;
		$display("location available: car parked ");
		@(negedge clk);
		//.........
		@(negedge clk);
		rst = 1;
		sn = 0;
		gL = 0;
		rL = 0;
		$display("ideal position ");
		@(negedge clk);
		@(negedge clk);
		rst = 0;
		sn = 1;
		gL = 0;
		rL = 0;
		$display("gate is opening now ");
		@(negedge clk);
		@(negedge clk);
		sn = 0;
		gL = 0;
		rL = 1;
		$display("no location for car parking ");
		@(negedge clk);
		@(negedge clk);
		$stop ;
		
	end
      
endmodule


`timescale 1ns / 1ps

module CAR_PARKING_PROPOSED( clk , rst , sn , gL , rL , status   );
	 
input clk , rst ,  sn , gL , rL  ;

output reg [1:0] status  ;

reg [1:0] state ;

parameter   Gate_close=2'b00 , Gate_open=2'b01 , location_for_car_parking=2'b10 , vehicle_in_location=2'b11 ;


always @ (posedge clk or posedge rst)

begin 
	if(rst) state <=  Gate_close ;
	else
		begin
			case(state)
				Gate_close :  state  <= sn ? Gate_open : Gate_close ;
				Gate_open  :begin 
								if(gL)
								state  <= location_for_car_parking  ;
								else if(rL)
								state  <= vehicle_in_location ;
								end
				location_for_car_parking :  state  <=  vehicle_in_location ; 
				vehicle_in_location : state <= vehicle_in_location  ;
			endcase
		end
end

always @*
begin
	status = state ;
end
endmodule

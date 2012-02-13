// Hamming code

// hammingCode.v


module hammingCode(clk, reset, dataIn, lengthIn, dataOut, lengthOut);

input clk;
input reset;
input [7:0] lengthIn;
input [lengthIn:0] dataIn;

output [7:0] lengthOut;
output [lengthOut:0] dataOut;

reg [7:0] counter;
reg [7:0] i;

always @(posedge clk) 
	begin
		if(reset) begin
			lengthIn = 0;
			dataIn = 0;
			lengthOut = 0;
			dataOut = 0;
			counter = 0;
		end
		else begin
		
			// Determine the length of encode bit stream
			lengthOut = lengthIn;
			while(lengthIn / 2 > 1) begin
				lengthOut = lengthOut + 1;
			end
			
			// Callculate the position of the encode bits + fill in info.
			counter = 1;
			i = 1;
			j = 0;
			
			while(counter < lengthOut) begin
				if(i = counter) begin
					dataOut[counter -1] = 0;
					i = i * 2;
				end
				else begin
					dataOut[counter-1] = dataIn[j];
					j++;
				end
				counter ++;
			end
		
		
		
		
		end
		
	end
	
endmodule
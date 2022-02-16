/* theta is the diffusion layer
this function is multiply the data matrix 
   a1  a2  a3  a4
   a5  a6  a7  a8
   a9  a10 a11 a12
   a13 a14 a15 a16
with a based on [8,4,5] MDS linear code generator matrix(H):
   1  2  4  6
   2  1  6  4
   4  6  1  2
   6  4  2  1
the equation is:  c = a*H
since every element in the matrix is from GF(2^8), and we multiply him, we need
to do modulo with the primitive polynom the algorithm is using - "11d".
when multiply, the fist line of the result matrix is:
c1 = a1 + 2*(a2 + a4) + 4*(a3 + a4)
c2 = a2 + 2*(a1 + a3) + 4*(a3 + a4)
c3 = a3 + 2*(a2 + a4) + 4*(a1 + a2)
c4 = a4 + 2*(a1 + a3) + 4*(a1 + a2)
the rest of the lines are in the same form, just with the elements of the compatible line
in the input matrix
*/

module theta(
	input [127:0] data_in,
	output [127:0] deffused_data
);

assign deffused_data[127:96] = diffusion(data_in[127:96]);
assign deffused_data[95:64]  = diffusion(data_in[95:64]);
assign deffused_data[63:32]  = diffusion(data_in[63:32]);
assign deffused_data[31:0]   = diffusion(data_in[31:0]);

// ask mr. stro about the function module in verilog
// ask mr. stro about multiplication and modulo if the output isn't big enough
// what happened? does the calculation is made and then outputted or not?
function automatic [31:0] diffusion (input [31:0] data);
	localparam primitive_polynom = 12'h11d;
	//reg [31:0] diffusion_result; 
	begin
		diffusion[31:24] = (data[31:24] + 2*(data[23:16] + data[7:0]) + 4*(data[15:8] + data[7:0]))%primitive_polynom;   // a1 + 2*(a2 + a4) + 4*(a3 + a4)
		diffusion[23:16] = (data[23:16] + 2*(data[31:24] + data[15:8]) + 4*(data[15:8] + data[7:0]))%primitive_polynom;  // a2 + 2*(a1 + a3) + 4*(a3 + a4)
		diffusion[15:8]  = (data[15:8] + 2*(data[23:16] + data[7:0]) + 4*(data[31:24] + data[23:16]))%primitive_polynom; // a3 + 2*(a2 + a4) + 4*(a1 + a2)
		diffusion[7:0]   = (data[7:0] + 2*(data[31:24] + data[15:8]) + 4*(data[31:24] + data[23:16]))%primitive_polynom; // a4 + 2*(a1 + a3) + 4*(a1 + a2)
	end
endfunction

endmodule
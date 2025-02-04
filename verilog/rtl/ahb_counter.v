`timescale			1ns/1ps
`default_nettype    none

module ahb_counter #(
    parameter BITS = 16
)(
`ifdef USE_POWER_PINS
    inout wire vccd1,   // User area 1 1.8V supply
    inout wire vssd1,   // User area 1 digital ground
`endif

    // AHB-Lite Slave Interface
    input  wire         HCLK,       // AHB Clock
    input  wire         HRESETn,    // Active-low reset
    input  wire         HSEL,       // Slave select
    input  wire         HREADY,     // Transfer ready
    input  wire         HWRITE,     // Write enable
    input  wire [31:0]  HADDR,      // Address
    input  wire [31:0]  HWDATA,     // Write data
    input  wire [2:0]   HSIZE,      // Transfer size
    input  wire [1:0]   HTRANS,     // Transfer type
    output wire         HREADYOUT,  // Transfer done
    output wire [31:0]  HRDATA,     // Read data

    // GPIO Output
    output wire [BITS-1:0] gpio_out,
    output wire [BITS-1:0] gpio_oeb
);

    localparam COUNT_REG_OFFSET = 16'h0000;
    localparam CTRL_REG_OFFSET = 16'h0004;

    reg  last_HSEL, last_HWRITE; reg [31:0] last_HADDR; reg [1:0] last_HTRANS;
    always@ (posedge HCLK or negedge HRESETn) begin
        if(~HRESETn) begin
            last_HSEL       <= 1'b0;
            last_HADDR      <= 1'b0;
            last_HWRITE     <= 1'b0;
            last_HTRANS     <= 1'b0;
        end else if(HREADY) begin
            last_HSEL       <= HSEL;
            last_HADDR      <= HADDR;
            last_HWRITE     <= HWRITE;
            last_HTRANS     <= HTRANS;
        end               
    end
    wire    ahbl_valid	= last_HSEL & last_HTRANS[1];
    wire	ahbl_we	= last_HWRITE & ahbl_valid;
    wire	ahbl_re	= ~last_HWRITE & ahbl_valid;


    reg [BITS-1:0] COUNT_REG;
    reg CTRL_REG;

	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) COUNT_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==COUNT_REG_OFFSET))
                                            COUNT_REG <= HWDATA[BITS-1:0];

	always @(posedge HCLK or negedge HRESETn) if(~HRESETn) CTRL_REG <= 0;
                                        else if(ahbl_we & (last_HADDR[16-1:0]==CTRL_REG_OFFSET))
                                            CTRL_REG <= HWDATA[1-1:0];

    always @(posedge HCLK or negedge HRESETn) begin
        if (~HRESETn) begin
            COUNT_REG <= 0;
            CTRL_REG <= 0;
        end else begin
            if (CTRL_REG & ~ahbl_we) 
                COUNT_REG <= COUNT_REG + 1;
        end
    end

	assign	HRDATA = 
			(last_HADDR[16-1:0] == CTRL_REG_OFFSET)	? CTRL_REG :
			(last_HADDR[16-1:0] == COUNT_REG_OFFSET)    ? COUNT_REG :
			32'hDEADBEEF;

	assign  HREADYOUT = 1'b1;
    assign  gpio_out = COUNT_REG;
    assign  gpio_oeb = {(BITS){~HRESETn}};

endmodule

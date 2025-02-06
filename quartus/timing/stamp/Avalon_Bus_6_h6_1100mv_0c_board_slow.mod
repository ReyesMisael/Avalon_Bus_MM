/*
 Copyright (C) 2017  Intel Corporation. All rights reserved.
 Your use of Intel Corporation's design tools, logic functions 
 and other software and tools, and its AMPP partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Intel Program License 
 Subscription Agreement, the Intel Quartus Prime License Agreement,
 the Intel FPGA IP License Agreement, or other applicable license
 agreement, including, without limitation, that your use is for
 the sole purpose of programming logic devices manufactured by
 Intel and sold by Intel or its authorized distributors.  Please
 refer to the applicable agreement for further details.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Slow Corner delays for the design using part 5CSXFC6D6F31C6
 with speed grade 6_H6, core voltage 1.1V, and temperature 0 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "Avalon_Bus";
DATE "02/05/2025 19:41:40";
PROGRAM "Quartus Prime";



INPUT altera_reserved_tms;
INPUT altera_reserved_tck;
INPUT altera_reserved_tdi;
INPUT clk;
INPUT rst;
OUTPUT altera_reserved_tdo;

/*Arc definitions start here*/
pos_altera_reserved_tdi__altera_reserved_tck__setup:		SETUP (POSEDGE) altera_reserved_tdi altera_reserved_tck ;
pos_altera_reserved_tms__altera_reserved_tck__setup:		SETUP (POSEDGE) altera_reserved_tms altera_reserved_tck ;
pos_altera_reserved_tdi__altera_reserved_tck__hold:		HOLD (POSEDGE) altera_reserved_tdi altera_reserved_tck ;
pos_altera_reserved_tms__altera_reserved_tck__hold:		HOLD (POSEDGE) altera_reserved_tms altera_reserved_tck ;
pos_altera_reserved_tck__altera_reserved_tdo__delay:		DELAY (POSEDGE) altera_reserved_tck altera_reserved_tdo ;
pos_altera_reserved_tck__altera_reserved_tdo__delay:		DELAY (POSEDGE) altera_reserved_tck altera_reserved_tdo ;

ENDMODEL

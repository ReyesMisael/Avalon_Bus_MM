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
 This file contains Fast Corner delays for the design using part 5CSXFC6D6F31C6
 with speed grade M, core voltage 1.1V, and temperature 85 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "Avalon_Bus";
DATE "02/01/2025 16:03:49";
PROGRAM "Quartus Prime";



INPUT clk;
INPUT reset_n;
INPUT user_wrclk;
INPUT user_wrreq;
INPUT writeresponsevalid;
INPUT response[0];
INPUT response[1];
INPUT user_data[1];
INPUT user_data[5];
INPUT user_data[6];
INPUT user_data[7];
INPUT user_data[8];
INPUT user_data[4];
INPUT user_data[9];
INPUT user_data[2];
INPUT user_data[3];
INPUT user_data[0];
INPUT user_data[11];
INPUT user_data[15];
INPUT user_data[16];
INPUT user_data[17];
INPUT user_data[18];
INPUT user_data[14];
INPUT user_data[19];
INPUT user_data[12];
INPUT user_data[13];
INPUT user_data[10];
INPUT user_data[21];
INPUT user_data[25];
INPUT user_data[26];
INPUT user_data[27];
INPUT user_data[28];
INPUT user_data[24];
INPUT user_data[29];
INPUT user_data[22];
INPUT user_data[23];
INPUT user_data[20];
INPUT user_data[31];
INPUT user_data[30];
INPUT waitrequest;
OUTPUT write;
OUTPUT chipselect;
OUTPUT address[0];
OUTPUT address[1];
OUTPUT address[2];
OUTPUT address[3];
OUTPUT address[4];
OUTPUT address[5];
OUTPUT address[6];
OUTPUT address[7];
OUTPUT address[8];
OUTPUT address[9];
OUTPUT address[10];
OUTPUT address[11];
OUTPUT address[12];
OUTPUT address[13];
OUTPUT address[14];
OUTPUT address[15];
OUTPUT address[16];
OUTPUT address[17];
OUTPUT address[18];
OUTPUT address[19];
OUTPUT address[20];
OUTPUT address[21];
OUTPUT address[22];
OUTPUT address[23];
OUTPUT address[24];
OUTPUT address[25];
OUTPUT address[26];
OUTPUT address[27];
OUTPUT address[28];
OUTPUT address[29];
OUTPUT address[30];
OUTPUT address[31];
OUTPUT byteenable[0];
OUTPUT byteenable[1];
OUTPUT byteenable[2];
OUTPUT byteenable[3];
OUTPUT writedata[0];
OUTPUT writedata[1];
OUTPUT writedata[2];
OUTPUT writedata[3];
OUTPUT writedata[4];
OUTPUT writedata[5];
OUTPUT writedata[6];
OUTPUT writedata[7];
OUTPUT writedata[8];
OUTPUT writedata[9];
OUTPUT writedata[10];
OUTPUT writedata[11];
OUTPUT writedata[12];
OUTPUT writedata[13];
OUTPUT writedata[14];
OUTPUT writedata[15];
OUTPUT writedata[16];
OUTPUT writedata[17];
OUTPUT writedata[18];
OUTPUT writedata[19];
OUTPUT writedata[20];
OUTPUT writedata[21];
OUTPUT writedata[22];
OUTPUT writedata[23];
OUTPUT writedata[24];
OUTPUT writedata[25];
OUTPUT writedata[26];
OUTPUT writedata[27];
OUTPUT writedata[28];
OUTPUT writedata[29];
OUTPUT writedata[30];
OUTPUT writedata[31];
OUTPUT user_rdempty;
OUTPUT user_fifo_full;

/*Arc definitions start here*/
pos_response[0]__clk__setup:		SETUP (POSEDGE) response[0] clk ;
pos_response[1]__clk__setup:		SETUP (POSEDGE) response[1] clk ;
pos_writeresponsevalid__clk__setup:		SETUP (POSEDGE) writeresponsevalid clk ;
pos_user_data[0]__user_wrclk__setup:		SETUP (POSEDGE) user_data[0] user_wrclk ;
pos_user_data[1]__user_wrclk__setup:		SETUP (POSEDGE) user_data[1] user_wrclk ;
pos_user_data[2]__user_wrclk__setup:		SETUP (POSEDGE) user_data[2] user_wrclk ;
pos_user_data[3]__user_wrclk__setup:		SETUP (POSEDGE) user_data[3] user_wrclk ;
pos_user_data[4]__user_wrclk__setup:		SETUP (POSEDGE) user_data[4] user_wrclk ;
pos_user_data[5]__user_wrclk__setup:		SETUP (POSEDGE) user_data[5] user_wrclk ;
pos_user_data[6]__user_wrclk__setup:		SETUP (POSEDGE) user_data[6] user_wrclk ;
pos_user_data[7]__user_wrclk__setup:		SETUP (POSEDGE) user_data[7] user_wrclk ;
pos_user_data[8]__user_wrclk__setup:		SETUP (POSEDGE) user_data[8] user_wrclk ;
pos_user_data[9]__user_wrclk__setup:		SETUP (POSEDGE) user_data[9] user_wrclk ;
pos_user_data[10]__user_wrclk__setup:		SETUP (POSEDGE) user_data[10] user_wrclk ;
pos_user_data[11]__user_wrclk__setup:		SETUP (POSEDGE) user_data[11] user_wrclk ;
pos_user_data[12]__user_wrclk__setup:		SETUP (POSEDGE) user_data[12] user_wrclk ;
pos_user_data[13]__user_wrclk__setup:		SETUP (POSEDGE) user_data[13] user_wrclk ;
pos_user_data[14]__user_wrclk__setup:		SETUP (POSEDGE) user_data[14] user_wrclk ;
pos_user_data[15]__user_wrclk__setup:		SETUP (POSEDGE) user_data[15] user_wrclk ;
pos_user_data[16]__user_wrclk__setup:		SETUP (POSEDGE) user_data[16] user_wrclk ;
pos_user_data[17]__user_wrclk__setup:		SETUP (POSEDGE) user_data[17] user_wrclk ;
pos_user_data[18]__user_wrclk__setup:		SETUP (POSEDGE) user_data[18] user_wrclk ;
pos_user_data[19]__user_wrclk__setup:		SETUP (POSEDGE) user_data[19] user_wrclk ;
pos_user_data[20]__user_wrclk__setup:		SETUP (POSEDGE) user_data[20] user_wrclk ;
pos_user_data[21]__user_wrclk__setup:		SETUP (POSEDGE) user_data[21] user_wrclk ;
pos_user_data[22]__user_wrclk__setup:		SETUP (POSEDGE) user_data[22] user_wrclk ;
pos_user_data[23]__user_wrclk__setup:		SETUP (POSEDGE) user_data[23] user_wrclk ;
pos_user_data[24]__user_wrclk__setup:		SETUP (POSEDGE) user_data[24] user_wrclk ;
pos_user_data[25]__user_wrclk__setup:		SETUP (POSEDGE) user_data[25] user_wrclk ;
pos_user_data[26]__user_wrclk__setup:		SETUP (POSEDGE) user_data[26] user_wrclk ;
pos_user_data[27]__user_wrclk__setup:		SETUP (POSEDGE) user_data[27] user_wrclk ;
pos_user_data[28]__user_wrclk__setup:		SETUP (POSEDGE) user_data[28] user_wrclk ;
pos_user_data[29]__user_wrclk__setup:		SETUP (POSEDGE) user_data[29] user_wrclk ;
pos_user_data[30]__user_wrclk__setup:		SETUP (POSEDGE) user_data[30] user_wrclk ;
pos_user_data[31]__user_wrclk__setup:		SETUP (POSEDGE) user_data[31] user_wrclk ;
pos_user_wrreq__user_wrclk__setup:		SETUP (POSEDGE) user_wrreq user_wrclk ;
pos_response[0]__clk__hold:		HOLD (POSEDGE) response[0] clk ;
pos_response[1]__clk__hold:		HOLD (POSEDGE) response[1] clk ;
pos_writeresponsevalid__clk__hold:		HOLD (POSEDGE) writeresponsevalid clk ;
pos_user_data[0]__user_wrclk__hold:		HOLD (POSEDGE) user_data[0] user_wrclk ;
pos_user_data[1]__user_wrclk__hold:		HOLD (POSEDGE) user_data[1] user_wrclk ;
pos_user_data[2]__user_wrclk__hold:		HOLD (POSEDGE) user_data[2] user_wrclk ;
pos_user_data[3]__user_wrclk__hold:		HOLD (POSEDGE) user_data[3] user_wrclk ;
pos_user_data[4]__user_wrclk__hold:		HOLD (POSEDGE) user_data[4] user_wrclk ;
pos_user_data[5]__user_wrclk__hold:		HOLD (POSEDGE) user_data[5] user_wrclk ;
pos_user_data[6]__user_wrclk__hold:		HOLD (POSEDGE) user_data[6] user_wrclk ;
pos_user_data[7]__user_wrclk__hold:		HOLD (POSEDGE) user_data[7] user_wrclk ;
pos_user_data[8]__user_wrclk__hold:		HOLD (POSEDGE) user_data[8] user_wrclk ;
pos_user_data[9]__user_wrclk__hold:		HOLD (POSEDGE) user_data[9] user_wrclk ;
pos_user_data[10]__user_wrclk__hold:		HOLD (POSEDGE) user_data[10] user_wrclk ;
pos_user_data[11]__user_wrclk__hold:		HOLD (POSEDGE) user_data[11] user_wrclk ;
pos_user_data[12]__user_wrclk__hold:		HOLD (POSEDGE) user_data[12] user_wrclk ;
pos_user_data[13]__user_wrclk__hold:		HOLD (POSEDGE) user_data[13] user_wrclk ;
pos_user_data[14]__user_wrclk__hold:		HOLD (POSEDGE) user_data[14] user_wrclk ;
pos_user_data[15]__user_wrclk__hold:		HOLD (POSEDGE) user_data[15] user_wrclk ;
pos_user_data[16]__user_wrclk__hold:		HOLD (POSEDGE) user_data[16] user_wrclk ;
pos_user_data[17]__user_wrclk__hold:		HOLD (POSEDGE) user_data[17] user_wrclk ;
pos_user_data[18]__user_wrclk__hold:		HOLD (POSEDGE) user_data[18] user_wrclk ;
pos_user_data[19]__user_wrclk__hold:		HOLD (POSEDGE) user_data[19] user_wrclk ;
pos_user_data[20]__user_wrclk__hold:		HOLD (POSEDGE) user_data[20] user_wrclk ;
pos_user_data[21]__user_wrclk__hold:		HOLD (POSEDGE) user_data[21] user_wrclk ;
pos_user_data[22]__user_wrclk__hold:		HOLD (POSEDGE) user_data[22] user_wrclk ;
pos_user_data[23]__user_wrclk__hold:		HOLD (POSEDGE) user_data[23] user_wrclk ;
pos_user_data[24]__user_wrclk__hold:		HOLD (POSEDGE) user_data[24] user_wrclk ;
pos_user_data[25]__user_wrclk__hold:		HOLD (POSEDGE) user_data[25] user_wrclk ;
pos_user_data[26]__user_wrclk__hold:		HOLD (POSEDGE) user_data[26] user_wrclk ;
pos_user_data[27]__user_wrclk__hold:		HOLD (POSEDGE) user_data[27] user_wrclk ;
pos_user_data[28]__user_wrclk__hold:		HOLD (POSEDGE) user_data[28] user_wrclk ;
pos_user_data[29]__user_wrclk__hold:		HOLD (POSEDGE) user_data[29] user_wrclk ;
pos_user_data[30]__user_wrclk__hold:		HOLD (POSEDGE) user_data[30] user_wrclk ;
pos_user_data[31]__user_wrclk__hold:		HOLD (POSEDGE) user_data[31] user_wrclk ;
pos_user_wrreq__user_wrclk__hold:		HOLD (POSEDGE) user_wrreq user_wrclk ;
pos_clk__address[0]__delay:		DELAY (POSEDGE) clk address[0] ;
pos_clk__address[1]__delay:		DELAY (POSEDGE) clk address[1] ;
pos_clk__address[2]__delay:		DELAY (POSEDGE) clk address[2] ;
pos_clk__address[3]__delay:		DELAY (POSEDGE) clk address[3] ;
pos_clk__address[4]__delay:		DELAY (POSEDGE) clk address[4] ;
pos_clk__address[5]__delay:		DELAY (POSEDGE) clk address[5] ;
pos_clk__address[6]__delay:		DELAY (POSEDGE) clk address[6] ;
pos_clk__byteenable[0]__delay:		DELAY (POSEDGE) clk byteenable[0] ;
pos_clk__byteenable[1]__delay:		DELAY (POSEDGE) clk byteenable[1] ;
pos_clk__byteenable[2]__delay:		DELAY (POSEDGE) clk byteenable[2] ;
pos_clk__byteenable[3]__delay:		DELAY (POSEDGE) clk byteenable[3] ;
pos_clk__chipselect__delay:		DELAY (POSEDGE) clk chipselect ;
pos_clk__user_rdempty__delay:		DELAY (POSEDGE) clk user_rdempty ;
pos_clk__write__delay:		DELAY (POSEDGE) clk write ;
pos_clk__writedata[0]__delay:		DELAY (POSEDGE) clk writedata[0] ;
pos_clk__writedata[1]__delay:		DELAY (POSEDGE) clk writedata[1] ;
pos_clk__writedata[2]__delay:		DELAY (POSEDGE) clk writedata[2] ;
pos_clk__writedata[3]__delay:		DELAY (POSEDGE) clk writedata[3] ;
pos_clk__writedata[4]__delay:		DELAY (POSEDGE) clk writedata[4] ;
pos_clk__writedata[5]__delay:		DELAY (POSEDGE) clk writedata[5] ;
pos_clk__writedata[6]__delay:		DELAY (POSEDGE) clk writedata[6] ;
pos_clk__writedata[7]__delay:		DELAY (POSEDGE) clk writedata[7] ;
pos_clk__writedata[8]__delay:		DELAY (POSEDGE) clk writedata[8] ;
pos_clk__writedata[9]__delay:		DELAY (POSEDGE) clk writedata[9] ;
pos_clk__writedata[10]__delay:		DELAY (POSEDGE) clk writedata[10] ;
pos_clk__writedata[11]__delay:		DELAY (POSEDGE) clk writedata[11] ;
pos_clk__writedata[12]__delay:		DELAY (POSEDGE) clk writedata[12] ;
pos_clk__writedata[13]__delay:		DELAY (POSEDGE) clk writedata[13] ;
pos_clk__writedata[14]__delay:		DELAY (POSEDGE) clk writedata[14] ;
pos_clk__writedata[15]__delay:		DELAY (POSEDGE) clk writedata[15] ;
pos_clk__writedata[16]__delay:		DELAY (POSEDGE) clk writedata[16] ;
pos_clk__writedata[17]__delay:		DELAY (POSEDGE) clk writedata[17] ;
pos_clk__writedata[18]__delay:		DELAY (POSEDGE) clk writedata[18] ;
pos_clk__writedata[19]__delay:		DELAY (POSEDGE) clk writedata[19] ;
pos_clk__writedata[20]__delay:		DELAY (POSEDGE) clk writedata[20] ;
pos_clk__writedata[21]__delay:		DELAY (POSEDGE) clk writedata[21] ;
pos_clk__writedata[22]__delay:		DELAY (POSEDGE) clk writedata[22] ;
pos_clk__writedata[23]__delay:		DELAY (POSEDGE) clk writedata[23] ;
pos_clk__writedata[24]__delay:		DELAY (POSEDGE) clk writedata[24] ;
pos_clk__writedata[25]__delay:		DELAY (POSEDGE) clk writedata[25] ;
pos_clk__writedata[26]__delay:		DELAY (POSEDGE) clk writedata[26] ;
pos_clk__writedata[27]__delay:		DELAY (POSEDGE) clk writedata[27] ;
pos_clk__writedata[28]__delay:		DELAY (POSEDGE) clk writedata[28] ;
pos_clk__writedata[29]__delay:		DELAY (POSEDGE) clk writedata[29] ;
pos_clk__writedata[30]__delay:		DELAY (POSEDGE) clk writedata[30] ;
pos_clk__writedata[31]__delay:		DELAY (POSEDGE) clk writedata[31] ;
pos_user_wrclk__user_fifo_full__delay:		DELAY (POSEDGE) user_wrclk user_fifo_full ;

ENDMODEL

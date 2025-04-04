##Set clock frequency to 100 MHz. Helps guide the placement and routing algorithm
##to synthesize design that satisfies this constraint, and gives better power estimations
## 100 MHz frequency, 10 ns period,, duty cycle 50%, no phase shift
create_clock -period 15 [get_ports Clk]

##set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets Reset_IBUF]

##This part is to assign a pin number to 100MHz clock signal
set_property PACKAGE_PIN E3 [get_ports Clk]
set_property IOSTANDARD LVCMOS33 [get_ports Clk]

## This part is to activate or deactive ANODE of each display digit
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[0]}]
set_property PACKAGE_PIN J17 [get_ports {en_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[1]}]
set_property PACKAGE_PIN J18 [get_ports {en_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[2]}]
set_property PACKAGE_PIN T9 [get_ports {en_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[3]}]
set_property PACKAGE_PIN J14 [get_ports {en_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[4]}]
set_property PACKAGE_PIN P14 [get_ports {en_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[5]}]
set_property PACKAGE_PIN T14 [get_ports {en_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[6]}]
set_property PACKAGE_PIN K2 [get_ports {en_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[7]}]
set_property PACKAGE_PIN U13 [get_ports {en_out[7]}]

##This part is to assign pin numbers for 7 segments of the digit display
set_property IOSTANDARD LVCMOS33 [get_ports {out7[6]}]
set_property PACKAGE_PIN T10 [get_ports {out7[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out7[5]}]
set_property PACKAGE_PIN R10 [get_ports {out7[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out7[4]}]
set_property PACKAGE_PIN K16 [get_ports {out7[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out7[3]}]
set_property PACKAGE_PIN K13 [get_ports {out7[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out7[2]}]
set_property PACKAGE_PIN P15 [get_ports {out7[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out7[1]}]
set_property PACKAGE_PIN T11 [get_ports {out7[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out7[0]}]
set_property PACKAGE_PIN L18 [get_ports {out7[0]}]

# Assigning pin for sending Reset signal to the circuit.
# Corresponds to the center button of the 5 push buttons.
set_property IOSTANDARD LVCMOS33 [get_ports {Reset}]
set_property PACKAGE_PIN N17 [get_ports {Reset}]


##This part is to assign pin numbers for input numbers
##Number[6] - Most Significant Bit (MSB) => SW6 (pin U18)
##Number[0] - Least Siginificant Bit (LSB) => SW0 (pin J15)

##This part can be used to pass the input using switches on board. However, for the current lab, you do not need to use it.
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberB[7]}]
#set_property PACKAGE_PIN V10 [get_ports {NumberB[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberB[6]}]
#set_property PACKAGE_PIN U11 [get_ports {NumberB[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberB[5]}]
#set_property PACKAGE_PIN U12 [get_ports {NumberB[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberB[4]}]
#set_property PACKAGE_PIN H6 [get_ports {NumberB[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberB[3]}]
#set_property PACKAGE_PIN T13 [get_ports {NumberB[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberB[2]}]
#set_property PACKAGE_PIN R16 [get_ports {NumberB[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberB[1]}]
#set_property PACKAGE_PIN U8 [get_ports {NumberB[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberB[0]}]
#set_property PACKAGE_PIN T8 [get_ports {NumberB[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberA[7]}]
#set_property PACKAGE_PIN R13 [get_ports {NumberA[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberA[6]}]
#set_property PACKAGE_PIN U18 [get_ports {NumberA[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberA[5]}]
#set_property PACKAGE_PIN T18 [get_ports {NumberA[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberA[4]}]
#set_property PACKAGE_PIN R17 [get_ports {NumberA[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberA[3]}]
#set_property PACKAGE_PIN R15 [get_ports {NumberA[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberA[2]}]
#set_property PACKAGE_PIN M13 [get_ports {NumberA[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberA[1]}]
#set_property PACKAGE_PIN L16 [get_ports {NumberA[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {NumberA[0]}]
#set_property PACKAGE_PIN J15 [get_ports {NumberA[0]}]
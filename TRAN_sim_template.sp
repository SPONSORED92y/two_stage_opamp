*  Fully Differential Operational Amplifier Design ****
*  .TRAN Analysis 
* Objective: Test "Slew Rate"
*************************************************************
.op
.option  
+post probe UNWRAP           	 
+dcon=1
+symb=1            	   	
+NUMDGT=6	
+MEASDGT=6	
+runlvl=6  
*************************************************************
.protect
.lib 'cic018.l' tt
.unprotect
.temp 27
.inc "opamp.cir"
*************************************************************
VVDD vdd gnd 1.8
VVCM vcm gnd 0.9
*************************************************************
Xopamp VIP VIN VOP VON VCM VDD GND opamp
*************************************************************
CCL1 von gnd 2p
CCL2 vop gnd 2p
*************************************************************
Vin1 in	 gnd pwl 0n	0 10n 0	10.001n 0.9	20n	0.9	
Ein1 VIP vcm in	 gnd  0.5
Ein2 VIN vcm in	 gnd -0.5
Eout out gnd VOP VON  1 
*************************************************************
.tran 1p 40n
.probe v(vip,vin)
.MEAS tran slew_rate deriv v(out) when v(out)=0.9
*************************************************************
.end
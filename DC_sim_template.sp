*  Fully Differential Operational Amplifier Design ****
*  .DC Analysis 
* Objective: Test "Output Swing"
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
vin+ vip 0
e1	 vin 0 poly(1) vip 0 1.8 -1 	
*************************************************************
.dc vin+ 0.895 0.905 0.001m
.probe v(vip,vin)
.MEAS DC Top_gain 	 deriv v(vop) when v(vop)=1.5
.MEAS DC Bottom_gain deriv v(von) when v(vop)=0.3
*************************************************************
.end
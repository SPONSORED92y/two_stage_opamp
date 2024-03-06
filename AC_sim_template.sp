*  Fully Differential Operational Amplifier Design ****
*  .AC Analysis 
* Objective: Test "bandwidth", "DC Gain" and "Phase Margin"
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
Vin1 in	 gnd ac	 1
Ein1 vip vcm in	 gnd  0.5
Ein2 vin vcm in	 gnd -0.5 
Eout out gnd VOP VON  1 
*************************************************************
.ac dec 100	1k 5g 	
.MEAS ac Unit_gain when	vdb(out)=0
.MEAS ac phase FIND vp(out) when vdb(out)=0
.MEAS ac phase_margin PARAM='180+phase'
.MEAS ac gainmax MAX vdb(out)
*************************************************************
.MEAS power_avg	AVG	P(VVDD)
*************************************************************
.END
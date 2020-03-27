  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtP)
    ;%
      section.nData     = 70;
      section.data(70)  = dumData; %prealloc
      
	  ;% rtP.NoiseBlock_Cov
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtP.NoiseBlock_seed
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtP.TDL2_vinit
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 6;
	
	  ;% rtP.TDL3_vinit
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 7;
	
	  ;% rtP.TDL4_vinit
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 8;
	
	  ;% rtP.TDL1_vinit
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 9;
	
	  ;% rtP.FromWorkspace1_Time0
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 12;
	
	  ;% rtP.FromWorkspace1_Data0
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 683;
	
	  ;% rtP.FromWorkspace_Time0
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 3367;
	
	  ;% rtP.FromWorkspace_Data0
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 4038;
	
	  ;% rtP.Integrator1_IC
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 7393;
	
	  ;% rtP.Integrator1_IC_ncexgjzmw2
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 7394;
	
	  ;% rtP.Internal_1_1_A
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 7395;
	
	  ;% rtP.Internal_1_1_B
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 7402;
	
	  ;% rtP.Internal_1_1_C
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 7403;
	
	  ;% rtP.Internal_1_1_InitialCondition
	  section.data(16).logicalSrcIdx = 16;
	  section.data(16).dtTransOffset = 7404;
	
	  ;% rtP.Internal_1_2_A
	  section.data(17).logicalSrcIdx = 17;
	  section.data(17).dtTransOffset = 7405;
	
	  ;% rtP.Internal_1_2_B
	  section.data(18).logicalSrcIdx = 18;
	  section.data(18).dtTransOffset = 7412;
	
	  ;% rtP.Internal_1_2_C
	  section.data(19).logicalSrcIdx = 19;
	  section.data(19).dtTransOffset = 7413;
	
	  ;% rtP.Internal_1_2_InitialCondition
	  section.data(20).logicalSrcIdx = 21;
	  section.data(20).dtTransOffset = 7414;
	
	  ;% rtP.Internal_1_3_A
	  section.data(21).logicalSrcIdx = 22;
	  section.data(21).dtTransOffset = 7415;
	
	  ;% rtP.Internal_1_3_B
	  section.data(22).logicalSrcIdx = 23;
	  section.data(22).dtTransOffset = 7422;
	
	  ;% rtP.Internal_1_3_C
	  section.data(23).logicalSrcIdx = 24;
	  section.data(23).dtTransOffset = 7423;
	
	  ;% rtP.Internal_1_3_InitialCondition
	  section.data(24).logicalSrcIdx = 26;
	  section.data(24).dtTransOffset = 7424;
	
	  ;% rtP.Internal_1_4_A
	  section.data(25).logicalSrcIdx = 27;
	  section.data(25).dtTransOffset = 7425;
	
	  ;% rtP.Internal_1_4_B
	  section.data(26).logicalSrcIdx = 28;
	  section.data(26).dtTransOffset = 7432;
	
	  ;% rtP.Internal_1_4_C
	  section.data(27).logicalSrcIdx = 29;
	  section.data(27).dtTransOffset = 7433;
	
	  ;% rtP.Internal_1_4_InitialCondition
	  section.data(28).logicalSrcIdx = 31;
	  section.data(28).dtTransOffset = 7434;
	
	  ;% rtP.WhiteNoise_Mean
	  section.data(29).logicalSrcIdx = 32;
	  section.data(29).dtTransOffset = 7435;
	
	  ;% rtP.WhiteNoise_StdDev
	  section.data(30).logicalSrcIdx = 33;
	  section.data(30).dtTransOffset = 7436;
	
	  ;% rtP.Internal_1_5_D
	  section.data(31).logicalSrcIdx = 37;
	  section.data(31).dtTransOffset = 7437;
	
	  ;% rtP.Internal_1_5_InitialCondition
	  section.data(32).logicalSrcIdx = 38;
	  section.data(32).dtTransOffset = 7438;
	
	  ;% rtP.Internal_1_6_InitialCondition
	  section.data(33).logicalSrcIdx = 43;
	  section.data(33).dtTransOffset = 7439;
	
	  ;% rtP.Internal_1_7_InitialCondition
	  section.data(34).logicalSrcIdx = 48;
	  section.data(34).dtTransOffset = 7440;
	
	  ;% rtP.Internal_1_8_InitialCondition
	  section.data(35).logicalSrcIdx = 53;
	  section.data(35).dtTransOffset = 7441;
	
	  ;% rtP.Internal_1_9_InitialCondition
	  section.data(36).logicalSrcIdx = 58;
	  section.data(36).dtTransOffset = 7442;
	
	  ;% rtP.Constant_Value
	  section.data(37).logicalSrcIdx = 59;
	  section.data(37).dtTransOffset = 7443;
	
	  ;% rtP.Constant1_Value
	  section.data(38).logicalSrcIdx = 60;
	  section.data(38).dtTransOffset = 7444;
	
	  ;% rtP.Constant2_Value
	  section.data(39).logicalSrcIdx = 61;
	  section.data(39).dtTransOffset = 7445;
	
	  ;% rtP.Integrator_IC
	  section.data(40).logicalSrcIdx = 62;
	  section.data(40).dtTransOffset = 7446;
	
	  ;% rtP.Constant_Value_j2acmgfiiu
	  section.data(41).logicalSrcIdx = 63;
	  section.data(41).dtTransOffset = 7447;
	
	  ;% rtP.Constant1_Value_hqnvu24bt3
	  section.data(42).logicalSrcIdx = 64;
	  section.data(42).dtTransOffset = 7448;
	
	  ;% rtP.Constant2_Value_npyz3ateru
	  section.data(43).logicalSrcIdx = 65;
	  section.data(43).dtTransOffset = 7449;
	
	  ;% rtP.Integrator_IC_fn2t5hk1b2
	  section.data(44).logicalSrcIdx = 66;
	  section.data(44).dtTransOffset = 7450;
	
	  ;% rtP.StandardRegressors_Gain
	  section.data(45).logicalSrcIdx = 67;
	  section.data(45).dtTransOffset = 7451;
	
	  ;% rtP.Wavenet_P1_Size
	  section.data(46).logicalSrcIdx = 68;
	  section.data(46).dtTransOffset = 7521;
	
	  ;% rtP.Wavenet_P1
	  section.data(47).logicalSrcIdx = 69;
	  section.data(47).dtTransOffset = 7523;
	
	  ;% rtP.Wavenet_P2_Size
	  section.data(48).logicalSrcIdx = 70;
	  section.data(48).dtTransOffset = 7524;
	
	  ;% rtP.Wavenet_P2
	  section.data(49).logicalSrcIdx = 71;
	  section.data(49).dtTransOffset = 7526;
	
	  ;% rtP.Wavenet_P3_Size
	  section.data(50).logicalSrcIdx = 72;
	  section.data(50).dtTransOffset = 7527;
	
	  ;% rtP.Wavenet_P3
	  section.data(51).logicalSrcIdx = 73;
	  section.data(51).dtTransOffset = 7529;
	
	  ;% rtP.Wavenet_P4_Size
	  section.data(52).logicalSrcIdx = 74;
	  section.data(52).dtTransOffset = 7530;
	
	  ;% rtP.Wavenet_P4
	  section.data(53).logicalSrcIdx = 75;
	  section.data(53).dtTransOffset = 7532;
	
	  ;% rtP.Wavenet_P5_Size
	  section.data(54).logicalSrcIdx = 76;
	  section.data(54).dtTransOffset = 7539;
	
	  ;% rtP.Wavenet_P5
	  section.data(55).logicalSrcIdx = 77;
	  section.data(55).dtTransOffset = 7541;
	
	  ;% rtP.Wavenet_P6_Size
	  section.data(56).logicalSrcIdx = 78;
	  section.data(56).dtTransOffset = 7590;
	
	  ;% rtP.Wavenet_P6
	  section.data(57).logicalSrcIdx = 79;
	  section.data(57).dtTransOffset = 7592;
	
	  ;% rtP.Wavenet_P7_Size
	  section.data(58).logicalSrcIdx = 80;
	  section.data(58).dtTransOffset = 7641;
	
	  ;% rtP.Wavenet_P7
	  section.data(59).logicalSrcIdx = 81;
	  section.data(59).dtTransOffset = 7643;
	
	  ;% rtP.Wavenet_P8_Size
	  section.data(60).logicalSrcIdx = 82;
	  section.data(60).dtTransOffset = 7644;
	
	  ;% rtP.Wavenet_P8
	  section.data(61).logicalSrcIdx = 83;
	  section.data(61).dtTransOffset = 7646;
	
	  ;% rtP.Wavenet_P9_Size
	  section.data(62).logicalSrcIdx = 84;
	  section.data(62).dtTransOffset = 7653;
	
	  ;% rtP.Wavenet_P10_Size
	  section.data(63).logicalSrcIdx = 86;
	  section.data(63).dtTransOffset = 7655;
	
	  ;% rtP.Wavenet_P10
	  section.data(64).logicalSrcIdx = 87;
	  section.data(64).dtTransOffset = 7657;
	
	  ;% rtP.Wavenet_P11_Size
	  section.data(65).logicalSrcIdx = 88;
	  section.data(65).dtTransOffset = 7658;
	
	  ;% rtP.Wavenet_P12_Size
	  section.data(66).logicalSrcIdx = 90;
	  section.data(66).dtTransOffset = 7660;
	
	  ;% rtP.Wavenet_P12
	  section.data(67).logicalSrcIdx = 91;
	  section.data(67).dtTransOffset = 7662;
	
	  ;% rtP.Wavenet_P13_Size
	  section.data(68).logicalSrcIdx = 92;
	  section.data(68).dtTransOffset = 7663;
	
	  ;% rtP.Wavenet_P14_Size
	  section.data(69).logicalSrcIdx = 94;
	  section.data(69).dtTransOffset = 7665;
	
	  ;% rtP.Wavenet_P14
	  section.data(70).logicalSrcIdx = 95;
	  section.data(70).dtTransOffset = 7667;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 3;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtB)
    ;%
      section.nData     = 11;
      section.data(11)  = dumData; %prealloc
      
	  ;% rtB.cko1stawzg
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtB.bctb3sinjw
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 4;
	
	  ;% rtB.fgcd1o5wqw
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 9;
	
	  ;% rtB.cow1crz01g
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 10;
	
	  ;% rtB.gobdsr0swg
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 11;
	
	  ;% rtB.jrsyzzcl1d
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 16;
	
	  ;% rtB.dom5fp4frf
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 17;
	
	  ;% rtB.e4pza2bthg
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 19;
	
	  ;% rtB.nafhdch12j
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 26;
	
	  ;% rtB.dqxikanc54
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 27;
	
	  ;% rtB.gwnv0eezvp
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 28;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% rtB.pao1bblb11.gle2tr3y42
	  section.data(1).logicalSrcIdx = 11;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% rtB.fsf2hml1ec.gle2tr3y42
	  section.data(1).logicalSrcIdx = 12;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(3) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 4;
    sectIdxOffset = 3;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtDW)
    ;%
      section.nData     = 9;
      section.data(9)  = dumData; %prealloc
      
	  ;% rtDW.awvthnja1g
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.dlqha54lfr
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 4;
	
	  ;% rtDW.at0ka4kyqa
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 8;
	
	  ;% rtDW.pm4pvzgl3h
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 12;
	
	  ;% rtDW.pxt2gygyjg
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 16;
	
	  ;% rtDW.nj4tsumc2v
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 17;
	
	  ;% rtDW.lmkjjdwi0g
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 18;
	
	  ;% rtDW.mqhougliim
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 19;
	
	  ;% rtDW.nupedttpik
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 22;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% rtDW.oikx21ant2.TimePtr
	  section.data(1).logicalSrcIdx = 9;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.n15g0qlasn.LoggedData
	  section.data(2).logicalSrcIdx = 10;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtDW.eloroqiapr.TimePtr
	  section.data(3).logicalSrcIdx = 11;
	  section.data(3).dtTransOffset = 5;
	
	  ;% rtDW.mzxr0nwsde.LoggedData
	  section.data(4).logicalSrcIdx = 12;
	  section.data(4).dtTransOffset = 6;
	
	  ;% rtDW.fuwscr4rpl.LoggedData
	  section.data(5).logicalSrcIdx = 13;
	  section.data(5).dtTransOffset = 8;
	
	  ;% rtDW.psy0ppzldd.LoggedData
	  section.data(6).logicalSrcIdx = 14;
	  section.data(6).dtTransOffset = 10;
	
	  ;% rtDW.cqlrontoii.LoggedData
	  section.data(7).logicalSrcIdx = 15;
	  section.data(7).dtTransOffset = 12;
	
	  ;% rtDW.bvjralric0.LoggedData
	  section.data(8).logicalSrcIdx = 16;
	  section.data(8).dtTransOffset = 14;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% rtDW.hivvmfmqqm
	  section.data(1).logicalSrcIdx = 17;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% rtDW.j2h32kzhbr.PrevIndex
	  section.data(1).logicalSrcIdx = 18;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.fpekpvjach.PrevIndex
	  section.data(2).logicalSrcIdx = 19;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 3603830051;
  targMap.checksum1 = 1752567022;
  targMap.checksum2 = 3141829140;
  targMap.checksum3 = 1405094121;


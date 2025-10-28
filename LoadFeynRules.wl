(* ::Package:: *)

If[StringMatchQ[InputString["Quit kernel (y/n) and restart FeynRules: "], "y"|"Y", IgnoreCase -> True], Quit[]]


FR$Parallel= False;
$FeynRulesPath= SetDirectory[$UserBaseDirectory<> "/Applications/FeynRules"];
<< FeynRules`;
FR$Loop= True;


SetDirectory[NotebookDirectory[]];
Get["./FeynRules_particle_info/FeynRule_CHPT_v1.wl"]
Get["./FeynRules_particle_info/nicer_typesetting.wl"]
Get["./FeynRules_particle_info/LoadField.wl"]
Get["./FeynRules_particle_info/DotExpand.wl"]

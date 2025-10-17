(* ::Package:: *)

If[StringMatchQ[InputString["Quit kernel (y/n) and restart FeynRules: "], "y"|"Y", IgnoreCase -> True], Quit[]]


SetDirectory[NotebookDirectory[]];


FR$Parallel= False;
$FeynRulesPath= SetDirectory[$UserBaseDirectory<> "/Applications/FeynRules"];
<< FeynRules`;
FR$Loop= True;

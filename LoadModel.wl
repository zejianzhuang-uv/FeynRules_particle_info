(* ::Package:: *)

LoadModelFile[f1_,f2_]:=Module[{p1=f1,p2=f2},
FAPatch[PatchModelsOnly->True,
FAModelsDirectory->FileNameJoin[{NotebookDirectory[],p1}]];
SetOptions[FourVector, FeynCalcInternal->False];
Model[p2];
];


(*loadFeynCalc[] := Module[{success, feyncalcVersion},
  If[Names["FeynCalc`*"] =!= {} && ValueQ[FeynCalc`$FeynCalcVersion],
    Print["FeynCalc is already loaded (Version: ", FeynCalc`$FeynCalcVersion, ")."];
    Return[True];
  ];
  Quiet @ Clear["Global`*"];
  $LoadAddOns = {"FeynArts"};
  $FAVerbose = 0;
  Print["Loading FeynCalc..."];
  success = Quiet @ Check[
    Get["FeynCalc`"];
    feyncalcVersion = FeynCalc`$FeynCalcVersion;
    Print["Successfully loaded FeynCalc version ", feyncalcVersion];
    True,
    Print["Failed to load FeynCalc. Please check if it is installed correctly."];
    False,
    {Get::noopen, Get::notfound}
  ];
  If[success,
    $LeviCivitaSign = -1;
    $LimitTo4 = False;
    Print["FeynCalc initialization complete."];
  ];
  success
]*)

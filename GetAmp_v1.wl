(* ::Package:: *)

GetContactDiagram[{i1_,i2_},{o1_,o2_},path_]:=Module[{d},
d=InsertFields[
CreateTopologies[0,2->2],
{i1,i2}->{o1,o2},
Model->FileNameJoin[{NotebookDirectory[],path}],
GenericModel->FileNameJoin[{NotebookDirectory[],path}],
InsertionLevel->{Classes}]];


GetContactAmp[{i1_,i2_},{o1_,o2_},path_]:=
Module[{d=getContactDiagram[{i1,i2},{o1,o2},path],amp},
amp=ExpandScalarProduct[
FCFAConvert[CreateFeynAmp[d,Truncated->True],
IncomingMomenta->{k1,p1},
OutgoingMomenta->{k2,p2},
UndoChiralSplittings->True,
ChangeDimension->4,
	List->False, 
	SMP->True, 
	Contract->True]]//DiracSimplify//DiracSubstitute67//DotExpand(*//FeynAmpDenominatorExplicit*);
amp//FullSimplify];

GetBornAmp[{i1_,i2_},{o1_,o2_},path_]:=
Module[{d=getContactDiagram[{i1,i2},{o1,o2},path],amp},
amp=ExpandScalarProduct[
FCFAConvert[CreateFeynAmp[d,Truncated->True],
IncomingMomenta->{k1,p1},
OutgoingMomenta->{k2,p2},
UndoChiralSplittings->True,
ChangeDimension->4,
	List->False, 
	SMP->True, 
	Contract->True]]//DiracSimplify//DiracSubstitute67//DotExpand(*//FeynAmpDenominatorExplicit*);
amp//FullSimplify];



GetContactAmpLECs[Ch_,factor_,path_]:=
Module[{n=Length[Ch]},
Table[getContactAmp[Ch[[i]],Ch[[j]],path]/factor//FullSimplify,{i,n},{j,n}]];


SChStructure[k_,p_,m_]:=FeynAmpDenominator[PropagatorDenominator[
   Momentum[k+p], m]];
SChStructure[k_,p_,m_List]:=Table[SChStructure[k,p,m[[i]]],{i,Length[m]}];

UChStructure[k_,p_,m_]:=FeynAmpDenominator[PropagatorDenominator[
   Momentum[k-p], m]];
UChStructure[k_,p_,m_List]:=Table[UChStructure[k,p,m[[i]]],{i,Length[m]}];

GetBornAmpLECs[Ch_,SUCh_List,path_]:=
Module[{n=Length[Ch],nn=Length[SUCh],amp,xx,yy},
amp=Table[GetBornAmp[Ch[[i]],Ch[[j]],path]//Simplify,{i,n},{j,n}];
xx=Table[amp//Coefficient[#,SUCh[[i]]]&//Simplify,{i,nn}];
yy=Table[i->xx[[i]],{i,nn}];
yy//Association
]


(*getBoxDiagram[{i1_,i2_},{o1_,o2_},path_]:=Module[{d},
d=InsertFields[
CreateTopologies[1,2->2,BoxesOnly],
{i1,i2}->{o1,o2},
Model->FileNameJoin[{NotebookDirectory[],path}],
GenericModel->FileNameJoin[{NotebookDirectory[],path}],
InsertionLevel->{Particles}]];*)


(*getBoxAmp[{i1_,i2_},{o1_,o2_},path_]:=
Module[{d=getBoxDiagram[{i1,i2},{o1,o2},path],amp},
amp=ExpandScalarProduct[
FCFAConvert[CreateFeynAmp[d,Truncated->True],
IncomingMomenta->{k1,p1},
OutgoingMomenta->{k2,p2},
UndoChiralSplittings->True,
ChangeDimension->4,
	List->False, 
	SMP->True, 
	Contract->True,LoopMomenta->q]]//DiracSimplify//DiracSubstitute67//DotExpand(*//FeynAmpDenominatorExplicit*);
amp];*)


(*getBoxLECs[Ch_,factor_,path_]:=
Module[{n=Length[Ch]},
Table[getBoxAmp[Ch[[i]],Ch[[j]],path]/factor//FullSimplify,{i,n},{j,n}]];*)


IsospinSpaceLECs[base_,matLECs_]:=base . matLECs . Transpose[base]//Simplify;

(* ::Package:: *)

GetParticleMass[x_]:=Module[
{s={
S[1]->mpip,
S[2]->mpi0,
-S[1]->mpip,
S[3]->mKp,
S[4]->mK0,
-S[3]->mKp,
S[5]->meta,
F[1]->mp,
F[2]->mn,
F[3]->mLambda,
F[4]->mSigp,
F[5]->mSigm,
F[6]->mSig0,
F[7]->mXi0,
F[8]->mXim,
S[6]->mDp,
S[7]->mD0,
S[8]->mDsp}},
Association[s][x]];
GetBaryonName[x_]:=Module[
{s={
F[1]->p,
F[2]->n,
F[3]->Lambda,
F[4]->Sigp,
F[5]->Sigm,
F[6]->Sig0,
F[7]->Xi0,
F[8]->Xim}},
Association[s][F[x]]];


GetContactDiagram[{i1_,i2_},{o1_,o2_},path_]:=Module[{d},
d=InsertFields[
CreateTopologies[0,2->2],
{i1,i2}->{o1,o2},
Model->FileNameJoin[{NotebookDirectory[],path}],
GenericModel->FileNameJoin[{NotebookDirectory[],path}],
InsertionLevel->{Classes}]];


GetContactAmp[{i1_,i2_},{o1_,o2_},path_]:=
Module[{d=GetContactDiagram[{i1,i2},{o1,o2},path],amp},
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
Module[{d=GetContactDiagram[{i1,i2},{o1,o2},path],amp},
amp=ExpandScalarProduct[
FCFAConvert[CreateFeynAmp[d,Truncated->True],
IncomingMomenta->{k1,p1},
OutgoingMomenta->{k2,p2},
UndoChiralSplittings->True,
ChangeDimension->4,
	List->False, 
	SMP->True, 
	Contract->True]]//DotExpand//Expand//DiracSubstitute67//Simplify;
amp];


GetContactAmpLECs[Ch_,factor_,path_]:=
Module[{n=Length[Ch]},
Table[GetContactAmp[Ch[[i]],Ch[[j]],path]/factor//FullSimplify,{i,n},{j,n}]];


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


(* ::Section:: *)
(*light-meson and heavy meson system*)


GetLHContactAmp[{i1_,i2_},{o1_,o2_},path_]:=
Module[{d=GetContactDiagram[{i1,i2},{o1,o2},path],amp},
FCClearScalarProducts[];
SetMandelstam[s, t, u, k1,p1,-k2,-p2, GetParticleMass[i1], GetParticleMass[i2], GetParticleMass[o1], GetParticleMass[o2]];
amp=ExpandScalarProduct[
FCFAConvert[CreateFeynAmp[d,Truncated->True],
IncomingMomenta->{k1,p1},
OutgoingMomenta->{k2,p2},
UndoChiralSplittings->True,
ChangeDimension->4,
	List->False, 
	SMP->True, 
	Contract->True]];
Return[amp(*//FeynAmpDenominatorExplicit*)//Simplify];FCClearScalarProducts[];];

GetLHContactAmpLECs[Ch_,factor_,path_]:=
Module[{n=Length[Ch]},
Table[GetLHContactAmp[Ch[[i]],Ch[[j]],path]/factor//FullSimplify,{i,n},{j,n}]];


(* ::Section:: *)
(*Born Diagram in meson-baryon interaction*)


(*MBSChFeynAmpDenominator[x_]:=1/(s-GetParticleMass[x]^2);
mMBSChFeynAmpDenominator[x_]:=1/(GetParticleMass[x]^2-s);*)
mMBSChFeynAmpDenominator[x_]:=FeynAmpDenominator[PropagatorDenominator[Momentum[k2+p2],GetParticleMass[x]]];
MBSChFeynAmpDenominator[x_]:=FeynAmpDenominator[PropagatorDenominator[Momentum[-k2-p2],GetParticleMass[x]]];

MBUChFeynAmpDenominator[x_]:=FeynAmpDenominator[PropagatorDenominator[Momentum[k2-p1],GetParticleMass[x]]];

MBSChStructure[x_]:=(GetParticleMass[x]*DiracGamma[Momentum[k2]] . 
     DiracGamma[5] . DiracGamma[
      Momentum[k1]] . DiracGamma[5] + 
   DiracGamma[Momentum[k2]] . 
    DiracGamma[5] . DiracGamma[
     Momentum[k2 + p2]] . DiracGamma[
     Momentum[k1]] . DiracGamma[5]);
MBUChStructure[x_]:=(GetParticleMass[x]*DiracGamma[Momentum[k1]] . DiracGamma[5] . DiracGamma[Momentum[k2]] . 
     DiracGamma[5] + DiracGamma[Momentum[k1]] . DiracGamma[5] . DiracGamma[Momentum[-k2 + p1]] . 
    DiracGamma[Momentum[k2]] . DiracGamma[5]);


SymbolMatrixQ[x_]:=If[NumMatrixQ[x],False,True];
NumMatrixQ[x_]:=AllTrue[x,NumberQ,2];


GetMBBornAmp[{i1_,i2_},{o1_,o2_},path_]:=
Module[{d=GetContactDiagram[{i1,i2},{o1,o2},path],amp},
(*FCClearScalarProducts[];
SetMandelstam[s, t, u, k1,p1,-k2,-p2, GetParticleMass[i1], GetParticleMass[i2], GetParticleMass[o1], GetParticleMass[o2]];*)
amp=ExpandScalarProduct[
FCFAConvert[CreateFeynAmp[d,Truncated->True],
IncomingMomenta->{k1,p1},
OutgoingMomenta->{k2,p2},
UndoChiralSplittings->True,
ChangeDimension->4,
	List->False, 
	SMP->True, 
	Contract->True]]//DotExpand//Expand//DiracSubstitute67//Simplify;
Return[amp(*//FeynAmpDenominatorExplicit*)//Simplify](*;FCClearScalarProducts[];*)];


(*GetMBBornAmpLECs[Ch_,FAD_List,mFAD_List,SUCh_List,path_]:=
Module[{n=Length[Ch],nn=Length[SUCh],amp,xx,yy,zz},
(*generate the amplitude*)
amp=Table[GetMBBornAmp[Ch[[i]],Ch[[j]],path]//Expand,{i,n},{j,n}];
xx=Table[If[NumberQ[amp //Coefficient[#,FAD[[i]]]&]==True,
If[NumberQ[amp //Coefficient[#,mFAD[[i]]]&]==True,0,amp //Coefficient[#,mFAD[[i]]]&],
amp //Coefficient[#,FAD[[i]]]&]//Simplify,{i,nn}];
yy=Table[FullSimplify[xx[[i]]]/SUCh[[i]]//Simplify,{i,nn}];
zz=Table[If[SymbolMatrixQ[yy[[i]]],i->yy[[i]],Nothing],{i,nn}];
zz//Association
];*)

GetMBBornAmpLECs[Ch_,FAD_List,SUCh_List,path_]:=
Module[{n=Length[Ch],nn=Length[SUCh],amp,xx,yy,zz},
(*generate the amplitude*)
amp=Table[GetMBBornAmp[Ch[[i]],Ch[[j]],path]//Expand,{i,n},{j,n}];
xx=Table[amp//Coefficient[#,FAD[[i]]]&,{i,nn}];
yy=Table[FullSimplify[xx[[i]]]/SUCh[[i]]//Simplify,{i,nn}];
zz=Table[If[SymbolMatrixQ[yy[[i]]],GetBaryonName[i]->yy[[i]],Nothing],{i,nn}];
zz//Association
]

GetMBBornAmpLECs[Ch_,FAD_List,mFAD_List,SUCh_List,path_]:=
Module[{n=Length[Ch],nn=Length[SUCh],amp,xx,yy,zz},
(*generate the amplitude*)
amp=Table[GetMBBornAmp[Ch[[i]],Ch[[j]],path]//Expand,{i,n},{j,n}];
xx=Table[Sum[Map[Coefficient[amp,#]&,{FAD[[i]],mFAD[[i]]}][[k]],{k,2}],{i,nn}];
yy=Table[FullSimplify[xx[[i]]]/SUCh[[i]]//Simplify,{i,nn}];
zz=Table[If[SymbolMatrixQ[yy[[i]]],GetBaryonName[i]->yy[[i]],Nothing],{i,nn}];
zz//Association
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

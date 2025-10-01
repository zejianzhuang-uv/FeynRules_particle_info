(* ::Package:: *)

(* ::Section:: *)
(*Parameter*)


MakeBoxes[gg,TraditionalForm]:="g";
MakeBoxes[Dp,TraditionalForm]:="\[ScriptCapitalD]"
MakeBoxes[Fp,TraditionalForm]:="\[ScriptCapitalF]"
MakeBoxes[f,TraditionalForm]:="f"


(* ::Section:: *)
(*Momenta*)


MakeBoxes[p1,TraditionalForm]:="\!\(\*SubscriptBox[\(p\), \(1\)]\)";
MakeBoxes[p2,TraditionalForm]:="\!\(\*SubscriptBox[\(p\), \(2\)]\)";
MakeBoxes[k1,TraditionalForm]:="\!\(\*SubscriptBox[\(k\), \(1\)]\)";
MakeBoxes[k2,TraditionalForm]:="\!\(\*SubscriptBox[\(k\), \(2\)]\)";
MakeBoxes[q1,TraditionalForm]:="\!\(\*SubscriptBox[\(q\), \(1\)]\)";


(* ::Section:: *)
(*Particle*)


MakeBoxes[pip,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[Pi]\), \(+\)]\)";
MakeBoxes[pim,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[Pi]\), \(-\)]\)";
MakeBoxes[pi0,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[Pi]\), \(0\)]\)";
MakeBoxes[Kp,TraditionalForm]:="\!\(\*SuperscriptBox[\(K\), \(+\)]\)";
MakeBoxes[Km,TraditionalForm]:="\!\(\*SuperscriptBox[\(K\), \(-\)]\)";
MakeBoxes[K0,TraditionalForm]:="\!\(\*SubscriptBox[\(K\), \(0\)]\)";
MakeBoxes[eta,TraditionalForm]:="\[Eta]";


(* ::Section:: *)
(*Mass*)


MakeBoxes[mpip,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Pi]\), \(+\)]]\)";
MakeBoxes[mpim,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Pi]\), \(-\)]]\)";
MakeBoxes[mpi0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Pi]\), \(0\)]]\)";

MakeBoxes[mKp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(K\), \(+\)]]\)";
MakeBoxes[mKm,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(K\), \(-\)]]\)";
MakeBoxes[mK0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(K\), \(0\)]]\)";

MakeBoxes[msu3,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(SU3\)]\)";
MakeBoxes[meta,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(\[Eta]\)]\)";

MakeBoxes[mrho0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Rho]\), \(0\)]]\)";
MakeBoxes[mrhop,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Rho]\), \(+\)]]\)";
MakeBoxes[mrhom,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Rho]\), \(-\)]]\)";

MakeBoxes[mKstp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(K\), \(*\(+\)\)]]\)";
MakeBoxes[mKst0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(K\), \(*\(0\)\)]]\)";
MakeBoxes[mKstm,TraditionalForm]:="\!\(\*SuperscriptBox[\(K\), \(*\(-\)\)]\)";

MakeBoxes[mphi,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(\[Phi]\)]\)";
MakeBoxes[mome,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(\[Omega]\)]\)";

MakeBoxes[mDsp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SubsuperscriptBox[\(D\), \(s\), \(+\)]]\)";
MakeBoxes[mDsp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(D\), \(0\)]]\)";
MakeBoxes[mDsp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(D\), \(+\)]]\)";

MakeBoxes[mp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(p\)]\)"
MakeBoxes[mn,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(n\)]\)"
MakeBoxes[mL,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(\[CapitalLambda]\)]\)"
MakeBoxes[mSigp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[CapitalSigma]\), \(+\)]]\)"
MakeBoxes[mSigm,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[CapitalSigma]\), \(-\)]]\)"
MakeBoxes[mSig0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[CapitalSigma]\), \(0\)]]\)"
MakeBoxes[mXim,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[CapitalXi]\), \(-\)]]\)";
MakeBoxes[mXi0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[CapitalXi]\), \(0\)]]\)"
MakeBoxes[mB,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(B\)]\)"

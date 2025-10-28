(* ::Package:: *)

(*DotExpand[expr_] :=
	expr //. {Dot[a___, b_ + c_, d___] :> Distribute[Dot[a, b + c, d]],
	Dot[a___, b_*c_, d___] :> b*Dot[a, c, d]/; NonCommFreeQ[b],
	Dot[a___, b_, d___] :> b*Dot[a, d] /; NonCommFreeQ[b]} /.
	Dot[] :> Sequence[];*)


NonCommFreeQ[_?NumberQ] :=
	True;



NonCommQ[_?NumberQ]   :=
	False;



DotExpand[expr_] :=
	expr //. {Dot[a___, b_ + c_, d___] :> Distribute[Dot[a, b + c, d]],
	Dot[a___, b_*c_, d___] :> b*Dot[a, c, d] /; NonCommFreeQ[b],
	Dot[a___, b_, d___] :> b*Dot[a, d] /; NonCommFreeQ[b],
	Dot[a___, b_*c__, d___] :> Dot[a, b, c, d] /; NonCommQ[b]} /.
	Dot[] :> Sequence[];


import PrettyTables
import Statistics
using DataFrames



function write_channel_info(name::String, ch::Vector{String}, file::String; mode="w+")
    c = join(ch, ",")
    open(file, mode) do ff
        write(ff, "$name={$c};\n\n")
    end
    return nothing
end

"""
totS: The sum of the strangesses of the two scattered particles

totQ: the sum of the charges of the two scattered particles

i1(2)_list: the two particles as input
"""
function _scattering_channel(totS::Int64, totQ::Int64, i1_vec::Vector{String}, i2_vec::Vector{String})
    ch = String[]
    FA_id = String[]
    thre = Float64[]
    for i1 in i1_vec
        m = select_particle(i1)
        for i2 in i2_vec
            b = select_particle(i2)
            if m[:S] + b[:S] == totS && m[:Q] + b[:Q] == totQ
                push!(ch, "(m$(m[:name]), m$(b[:name]))")  
                push!(FA_id, "{$(m[:FA_id]),$(b[:FA_id])}")
                push!(thre, m[:mass] + b[:mass])    
            end
        end
    end
    df = DataFrame(FA_id=FA_id, ch=ch, thre=thre)
    sort!(df, :thre)
    # PrettyTables.pretty_table(df, title="S=$totS, Q=$totQ", title_alignment = :c)
    return df
end

function isospin_combination(i1, i2)
    return [i1+i2:-1:abs(i1-i2)...]
end

function iso3_vec(isospin)
    if isospin == 1
        i3 = [1, 0, -1]
    elseif isospin == 0
        i3 = [0]
    elseif isospin == 3/2
        i3 = [3/2, 1/2, -1/2, -3/2]
    elseif isospin == 1/2
        i3 = [1/2, -1/2]
    end
    return i3
end

"""
isospin: The total isospin of the two particles
"""
function _scattering_channel(totS::Int64, totQ::Int64, isospin::Union{Float64, Int64}, i1_vec::Vector{String}, i2_vec::Vector{String})
    ch = Vector{Tuple{String, String}}([])
    FA_id = String[]
    thre = Float64[]
    for i1 in i1_vec
        m = select_particle(i1)
        for i2 in i2_vec
            b = select_particle(i2)
            if m[:S] + b[:S] == totS && m[:Q] + b[:Q] == totQ
                i3 = m[:i3] + b[:i3]
                if i3 in iso3_vec(isospin) && isospin in isospin_combination(m[:isospin], b[:isospin])
                push!(ch, ("$(m[:name])", "$(b[:name])"))  
                push!(FA_id, "{$(m[:FA_id]),$(b[:FA_id])}")
                push!(thre, m[:mass] + b[:mass])    
                end
            end
        end
    end
    df = DataFrame(FA_id=FA_id, ch=ch, thre=thre)
    sort!(df, :thre)
    # PrettyTables.pretty_table(df, title="S=$totS, Q=$totQ, I=$isospin", title_alignment = :c)
    return df
end

function get_isospin_base(scattering_channel::AbstractDataFrame; scattering_type=[:meson, :baryon])
    pion = ["pip", "pim", "pi0"]
    kaon = ["Kp", "Km", "K0", "K0bar"]
    eta = ["eta"]
    N = ["p", "n"]
    L = ["L"]
    Sig = ["Sigp", "Sig0", "Sigm"]
    Xi = ["Xim", "Xi0"]
    # 
    D = ["Dp", "D0"]
    Ds = ["Dsp"]
    chi = String[]
    avg_thre = Float64[]
    if scattering_type == [:meson, :baryon]
        _m = [pion, kaon, eta]
        _M = [N, L, Sig, Xi]
    elseif scattering_type == [:meson, :heavy_meson]
        _m = [pion, kaon, eta]
        _M = [D, Ds]
    end
    for mm in _m
        for bb in _M
            ch = copy(scattering_channel)
            ii = filter!(x -> x.ch[1] in mm && x.ch[2] in bb, ch)
            if size(ii)[1] == 0
                continue
            end
            push!(chi, "{" * join(ii.FA_id, ",") * "}" * "(*$(join(ii.ch, ","))*)")
            push!(avg_thre, Statistics.mean(ii.thre) )
        end
    end
    df = DataFrame(FA_id=chi, avg_thre = avg_thre)
    sort!(df, :avg_thre)
end




"""
Print the information of a particle with mass, strangess, charge, isospin and it third component, and id in FeynRules package.
"""
function particle_information(mass::Union{Float64, Int64}, S::Int64, Q::Int64, isospin::Union{Float64, Int64}, i3::Union{Float64, Int64}, FA_id::String)
    return mass, S, Q, isospin, i3, FA_id
end

function select_particle(name::String)
    if name == "pip" # u dbar, S = 0
        mass, S, Q, isospin, i3, FA_id = particle_information(139.6, 0, 1, 1, 1, "S[1]")
        selfcharged = "False"
        PropagatorType = "D"
        AntiParticleName = "pim"
    elseif name == "pim" # ubar d, S = 0
        mass, S, Q, isospin, i3, FA_id = particle_information(139.6, 0, -1, 1, -1, "-S[1]")
        selfcharged = "False"
        PropagatorType = "D"
        AntiParticleName = "pip"
    elseif name == "pi0" # (ddbar - uubar) / sqrt(2)
        mass, S, Q, isospin, i3, FA_id = particle_information(135, 0, 0, 1, 0, "S[2]")
        selfcharged = "True"
        PropagatorType = "D"
        AntiParticleName = "pi0"
    elseif name == "Kp" # u sbar, S=1
        mass, S, Q, isospin, i3, FA_id = particle_information(494, 1, 1, 1/2, 1/2, "S[3]")
        selfcharged = "False"
        PropagatorType = "D"
        AntiParticleName = "Km"
    elseif name == "Km" # ubar s, S=-1
        mass, S, Q, isospin, i3, FA_id = particle_information(494, -1, -1, 1/2, -1/2, "-S[3]")
        selfcharged = "False"
        PropagatorType = "D"
        AntiParticleName = "Kp"
    elseif name == "K0" # d sbar, S=1
        mass, S, Q, isospin, i3, FA_id = particle_information(498, 1, 0, 1/2, -1/2, "S[4]")
        selfcharged = "False"
        PropagatorType = "D"
        AntiParticleName = "K0bar"
    elseif name == "K0bar" # dbar s, S=-1
        mass, S, Q, isospin, i3, FA_id = particle_information(498, -1, 0, 1/2, 1/2, "-S[4]")
        PropagatorType = "D"
        selfcharged = "False"
        AntiParticleName = "K0"
    elseif name == "eta" # uubar + ddbar + ssbar
        mass, S, Q, isospin, i3, FA_id = particle_information(548, 0, 0, 0, 0, "S[5]")
        selfcharged = "True"
        PropagatorType = "D"
        AntiParticleName = "eta"
    elseif name == "Dp"
        mass, S, Q, isospin, i3, FA_id = particle_information(1869, 0, 1, 1/2, 1/2, "S[6]")
        selfcharged = "False"
        PropagatorType = "Straight"
        AntiParticleName = "Dm"
    elseif name == "Dm"
        mass, S, Q, isospin, i3, FA_id = particle_information(1869, 0, -1, 1/2, -1/2, "-S[6]")
        selfcharged = "False"
        PropagatorType = "Straight"
        AntiParticleName = "Dp"
    elseif name == "D0"
        mass, S, Q, isospin, i3, FA_id = particle_information(1865, 0, 0, 1/2, -1/2, "S[7]")
        selfcharged = "False"
        PropagatorType = "Straight"
        AntiParticleName = "D0bar"
    elseif name == "D0bar"
        mass, S, Q, isospin, i3, FA_id = particle_information(1865, 0, 0, 1/2, 1/2, "-S[7]")
        selfcharged = "False"
        PropagatorType = "Straight"
        AntiParticleName = "D0"
    elseif name == "Dsp"
        mass, S, Q, isospin, i3, FA_id = particle_information(1969, 1, 1, 0, 0, "S[8]")
        selfcharged = "False"
        PropagatorType = "Straight"
        AntiParticleName = "Dsm"
    elseif name == "Dsm"
        mass, S, Q, isospin, i3, FA_id = particle_information(1969, 1, -1, 0, 0, "-S[8]")
        selfcharged = "False"
        PropagatorType = "Straight"
        AntiParticleName = "Dsp"
    elseif name == "p" # uud
        mass, S, Q, isospin, i3, FA_id = particle_information(938, 0, 1, 1/2, 1/2, "F[1]") 
        selfcharged = "False"
        PropagatorType = "Straight"
        AntiParticleName = "pbar"
    elseif name == "n" # udd
        mass, S, Q, isospin, i3, FA_id = particle_information(940, 0, 0, 1/2, -1/2, "F[2]")
        selfcharged = "False"
        PropagatorType = "Straight"
        AntiParticleName = "nbar"
    elseif name == "L" # uds, S=-1
        selfcharged = "False"
        mass, S, Q, isospin, i3, FA_id = particle_information(1116, -1, 0, 0, 0, "F[3]")
        PropagatorType = "Straight"
        AntiParticleName = "Lbar"
    elseif name == "Sigp" # uus, S=-1
        selfcharged = "False"
        PropagatorType = "Straight"
        mass, S, Q, isospin, i3, FA_id = particle_information(1189, -1, 1, 1, 1, "F[4]")
        AntiParticleName = "Sigpbar"
    elseif name == "Sig0" # uds, S=-1
        selfcharged = "False"
        mass, S, Q, isospin, i3, FA_id = particle_information(1193, -1, 0, 1, 0, "F[5]")
        PropagatorType = "Straight"
        AntiParticleName = "Sig0bar"
    elseif name == "Sigm" # dds, S=-1
        selfcharged = "False"
        mass, S, Q, isospin, i3, FA_id = particle_information(1197, -1, -1, 1, -1, "F[6]")
        PropagatorType = "Straight"
        AntiParticleName = "Sigmbar"
    elseif name == "Xi0" # uss, S=-2
        selfcharged = "False"
        mass, S, Q, isospin, i3, FA_id = particle_information(1315, -2, 0, 1/2, 1/2, "F[7]")
        PropagatorType = "Straight"

        selfcharged = "False"
        AntiParticleName = "Xi0bar"
    elseif name == "Xim" # dss, S=-2
        selfcharged = "False"
        mass, S, Q, isospin, i3, FA_id = particle_information(1321, -2, -1, 1/2, -1/2, "F[8]")
        PropagatorType = "Straight"
        AntiParticleName = "Ximbar"
        selfcharged = "False"

    elseif name == "rhop" # u dbar
        selfcharged = "False"
        mass, S, Q, isospin, i3, FA_id = particle_information(776, 0, 1, 1, 1, "V[1]")
        PropagatorType = "Sine"
        AntiParticleName = "rhom"
    elseif name == "rhom" # ubar d
        selfcharged = "False"
        mass, S, Q, isospin, i3, FA_id = particle_information(776, 0, -1, 1, -1, "-V[1]")
        PropagatorType = "Sine"
        AntiParticleName = "rhop"
    elseif name == "rho0" # (ddbar - uubar ) / sqrt(2)
        selfcharged = "True"
        mass, S, Q, isospin, i3, FA_id = particle_information(776, 0, 0, 1, 0, "V[2]")
        PropagatorType = "Sine"
        AntiParticleName = "rho0"
    elseif name == "Kstp" # u sbar, S=1
        mass, S, Q, isospin, i3, FA_id = particle_information(892, 1, 1, 1/2, 1/2, "V[3]")
        selfcharged = "False"
        AntiParticleName = "Kstm"
        PropagatorType = "Sine"

    elseif name == "Kstm" # ubar s, S=-1
        mass, S, Q, isospin, i3, FA_id = particle_information(892, -1, -1, 1/2, 1/2, "-V[3]")
        selfcharged = "False"
        PropagatorType = "Sine"
        AntiParticleName = "Kstp"

    elseif name == "Kst0" # d sbar, S=1
        mass, S, Q, isospin, i3, FA_id = particle_information(892, 1, 0, 1/2, 1/2, "V[4]")
        selfcharged = "False"
        PropagatorType = "Sine"
        AntiParticleName = "Kst0bar"
    elseif name == "Kst0bar" # dbar s, S = -1
        mass, S, Q, isospin, i3, FA_id = particle_information(892, -1, 0, 1/2, 1/2, "-V[4]")
        selfcharged = "False"
        PropagatorType = "Sine"
        AntiParticleName = "Kst0"
    elseif name == "phi"
        mass, S, Q, isospin, i3, FA_id = particle_information(1020, 0, 0, 0, 0, "V[5]")
        selfcharged = "True"
        PropagatorType = "Sine"
        AntiParticleName = "phi"
    elseif name == "ome"
        mass, S, Q, isospin, i3, FA_id = particle_information(782, 0, 0, 0, 0, "V[6]")
        selfcharged = "True"
        PropagatorType = "Sine"
        AntiParticleName = "ome"
    elseif name == "Dstp"
        mass, S, Q, isospin, i3, FA_id = particle_information(2010, 0, 1, 1/2, 1/2, "V[7]")
        selfcharged = "False"
        PropagatorType = "Straight"
        AntiParticleName = "Dmst"
    elseif name == "Dsstp"
        mass, S, Q, isospin, i3, FA_id = particle_information(2112, 1, 1, 0, 0, "V[8]")
        selfcharged = "False"
        PropagatorType = "Straight"
        AntiParticleName = "Dsstm"
    end
    pp = Dict(
        :name => name,
        :mass => mass,
        :S => S,
        :Q => Q,
        :isospin => isospin,
        :i3 => i3,
        :FA_id => FA_id,
        :selfcharged => selfcharged,
        :PropagatorType =>PropagatorType,
        :AntiParticleName => AntiParticleName
    )
    return pp
end

function write_field_info(particle_list::Vector{String}, file::String; mode="w+")
    finf = [_field_info(p) for p in particle_list]
    finf = join(finf, ",\n\n(******************************)\n\n")
    write_author_info(file, mode=mode)
    open(file, "a+") do ff
        write(ff, "M\$ClassesDescription = {\n\n")
        write(ff, finf)
        write(ff, "\t};\n\n\n\n")
    end
    
    return nothing
end



function write_author_info(file; mode="w+")
    open(file, mode) do ff
        write(ff, "M\$Information = {\nAuthor -> \"Zejian Zhuang\",\nVersion -> 1.0}\n\n\n\n")
    end
    return nothing
end



function _field_info(particle)
    p = select_particle(particle)
    t = "$(p[:FA_id]) == {\n\tClassName -> $(p[:name]),\n\tSelfConjugate -> $(p[:selfcharged]),\n\tAntiParticleName -> $(p[:AntiParticleName]),\n\tMass -> {m$(p[:name]), $(p[:mass])},\n\tPropagatorLabel -> \"$(p[:name])\",\n\tPropagatorType -> $(p[:PropagatorType]),\n\tWidth -> 0\n\t}"
    return t
end






function write_params_info(name_list::Vector{String}, tex_name_list::Vector{String}, file::String)
    open(file, "a+") do ff
        write(ff, "M\$Parameters = {\n")
    end
    i = 1
    nmax = length(name_list)
    for (name, tn) in zip(name_list, tex_name_list)
        open(file, "a+") do ff
            write(ff, "\t$name == {ParameterType -> Internal, ComplexParameter -> False, Value -> 100, TeX -> \"$tn\"}$(i == nmax ? " " : ",")\n")
        end
        i += 1
    end
    open(file, "a+") do ff
        write(ff, "};\n")
    end
    return nothing
end
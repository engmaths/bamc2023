## Setup
using Pkg: Pkg;
Pkg.activate(@__DIR__);

using CSV, DataFrames, Dates

"""
    count_members(itr)

Count the number of times each element of an iterable occurs. Returns a `Dict` mapping
elements to their count.
"""
function count_members(itr)
    # Taken from https://stackoverflow.com/a/39167771
    d = Dict{eltype(itr), Int}()
    for val in itr
        if isa(val, Number) && isnan(val)
            continue
        end
        d[val] = get(d, val, 0) + 1
    end
    return d
end

submissions = CSV.read("submissions.csv", DataFrame; normalizenames = true, ntasks = 1)  # get parsing errors without ntasks = 1

# Special case
submissions.Session .= replace.(coalesce.(submissions.Session, ""), "agent based models"=>"agent-based models")
submissions.Title_of_presentation_or_poster .= replace.(submissions.Title_of_presentation_or_poster, "\""=>"")
submissions.Title_of_presentation_or_poster .= replace.(submissions.Title_of_presentation_or_poster, "₵"=>"ℂ")
submissions.Name_of_presenter .= replace.(coalesce.(submissions.Name_of_presenter, ""), "Stanislaw"=>"Stanisław")

# Remove lines with missing IDs
subset!(submissions, :ID => ByRow((!) ∘ ismissing))

# Rewrite times in 24-hour format
for i in eachindex(submissions.Time)
    if !ismissing(submissions.Time[i])
        if submissions.Time[i] == "0.506944444"
            # The joys of Excel...
            submissions.Time[i] = "12:10 PM"
        end
        submissions.Time[i] = Dates.format(Time(submissions.Time[i], "H:MM p"), "HH:MM")
    end
end

## Sessions
session_data = unique([NamedTuple{(:session, :day, :am_pm, :location)}(x)
                       for x in zip(submissions.Session, submissions.Day, submissions.AM_PM,
                                    submissions.Location) if x[1] !== missing])
session_count = count_members([x.session for x in unique(session_data)])
session_dups = findall((>)(1), session_count)


## Locations
locations = sort(unique(skipmissing(submissions.Location)))


## Session types
minisymposia = CSV.read("minisymposia.csv", DataFrame; normalizenames = true, ntasks = 1)
contributed = Set([
    "Acoustics",
    "Analysis of continuum mechanics",
    "Applied fluid dynamics",
    "Biofilms and pattern formation",
    "Blood and blood vessels",
    "Boundary layer flows and stability",
    "Cell and tissue mechanics",
    "Cell modelling",
    "Collective behaviour and transport",
    "Complex systems and control",
    "Droplets and impact",
    "Epidemiology and statistical learning",
    "Evaporation",
    "Filaments, membranes, and shells",
    "Game theory and agent-based models",
    "Geophysics and climate",
    "Granular and multiphase flows",
    "Industrial mathematics",
    "Liquid crystals and transport models",
    "Mathematical ecology",
    "Mathematical medicine",
    "Mathematics of energy",
    "Microfluidics and flow in porous media",
    "Neurons and networks",
    "Nonlinear dynamics and applications",
    "Numerical methods",
    "Self-propulsion and fluid-body interactions",
    "Solid mechanics",
    "Stochastic processes and random walks",
    "Thin films and contact lines",
    "Travelling waves",
])

# Check that all sessions are either minisymposia or contributed
@assert all(x -> (x.session in minisymposia.Title_of_minisymposium || x.session in contributed || x.session == "Poster" || x.session == ""), session_data)

## Normalise names
function normalise_names(firstauthor, otherauthors)
    # Change missing to empty string
    firstauthor = coalesce(firstauthor, "")
    otherauthors = coalesce(otherauthors, "")
    # Strip whitespace
    firstauthor = strip(firstauthor)
    otherauthors = strip(otherauthors)
    # Combine
    if (otherauthors == "-") || isempty(otherauthors)
        allauthors = firstauthor
    else
        allauthors = firstauthor * ", " * otherauthors
    end
    # Replace semi-colons with commas
    allauthors = replace(allauthors, ";" => ",")
    # Change "and" to commas
    allauthors = replace(allauthors, ", and " => ", ", " and " => ", ")
    # Strip titles
    allauthors = replace(allauthors, r"\b(Dr|Prof|Associate Professor|Professor)\.? " => "")
    # Remove dots from initials
    allauthors = replace(replace(allauthors, r"\b([A-Z])\." => s"\1 ", "É." => "É "), "  " => " ")
    # Remove spaces before commas
    allauthors = replace(allauthors, " ," => ",")
    # Remove affiliations
    allauthors = replace(allauthors, r"\s*\([^)]*\)" => "")
    # Ensure that no names are all uppercase
    names = split(allauthors, ", ")
    for (i, name) in pairs(names)
        if uppercase(name) == name
            names[i] = titlecase(name)
        end
    end
    allauthors = join(names, ", ")
    # Special cases
    allauthors = replace(allauthors, ", Concordia University" => "")
    allauthors = replace(allauthors, ", University of Surrey" => "")
    if (length(allauthors) > 0) && allauthors[end] == ','
        allauthors = allauthors[1:end-1]
    end
    return allauthors
end

transform!(submissions, [:Name_of_presenter, :Names_of_any_other_authors] => ByRow(normalise_names) => :all_names)


## Colors

location_colors = Dict([
    "2Q42" => "BrightAqua",
    "2Q48" => "BrightBlue",
    "2Q49" => "BrightOrange",
    "2Q50/51" => "BrightPurple",
    "3E11" => "BrightPink",
    "3Q16" => "BrightLime",
    "3Q68" => "DarkAqua",
    "4Q04" => "DarkBlue",
    "4Q05" => "DarkOrange",
    "4Q07" => "DarkPurple",
    "4Q08" => "DarkPink",
    "4Q56" => "DarkLime",
])  # not used

day_colors = Dict([
    "MON" => "BrightOrange",
    "TUE" => "BrightBlue",
    "WED" => "BrightPurple",
])


## Formatting

function latex_table(io::IO, df)
    # Sanity checking
    @assert all(x -> x == df.Location[1], df.Location)
    @assert all(x -> x == df.Day[1], df.Day)
    @assert all(x -> x == df.AM_PM[1], df.AM_PM)
    @assert all(x -> x == df.Session[1], df.Session)
    # Sorting
    sort!(df, :Number)
    # Generate LaTeX table
    color = day_colors[df.Day[1]]
    println(io, "\\rowcolors{2}{$(color)!25}{$(color)!10}")
    println(io, "\\begin{tabularx}{\\linewidth}{C{15mm}YP{50mm}}")
    println(io, "\\rowcolor{$(color)}\\textcolor{white}{\\textbf{$(df.Location[1])}} & & \\\\")
    println(io, "& \\textbf{$(df.Session[1])} & \\\\")
    for row in eachrow(df)
        title = replace(row.Title_of_presentation_or_poster, "&" => "\\&")
        allauthors = replace(row.all_names, "&" => "\\&", "ł"=>"{\\l}")
        if row.Time !== missing
            println(io, "$(row.Time) & $(title) & $(allauthors)\\\\")
        end
    end
    println(io, "\\end{tabularx}\n")
end
latex_table(df) = latex_table(stdout, df)

days = ["MON", "TUE", "WED"]
am_pms = ["AM", "PM"]

nice_name = Dict([
    ("MON", "") => "Monday",
    ("TUE", "") => "Tuesday",
    ("WED", "") => "Wednesday",
    ("MON", "All day") => "Monday",
    ("TUE", "All day") => "Tuesday",
    ("WED", "All day") => "Wednesday",
    ("MON", "AM") => "Monday 11:10–13:10",
    ("TUE", "AM") => "Tuesday 10:30–12:30",
    ("WED", "AM") => "Wednesday 10:30–12:30",
    ("MON", "PM") => "Monday 14:10–16:10",
    ("TUE", "PM") => "Tuesday 13:30–15:30",
])


## Generate minisymposia listings

lastday = ""
lastam_pm = ""

open("minisymposia.tex", "w") do io
    for (location, am_pm, day) in Iterators.product(locations, am_pms, days)
        global lastday, lastam_pm
        df = subset(submissions, :Location => ByRow(==(location)), :AM_PM => ByRow(==(am_pm)), :Day => ByRow(==(day)); skipmissing = true)
        if (size(df, 1) > 0) && (df.Session[1] in minisymposia.Title_of_minisymposium)
            if (day != lastday) || (am_pm != lastam_pm)
                println(io, "\\subsection{", nice_name[(day, am_pm)], "}\n")
                lastday = day
                lastam_pm = am_pm
            end
            latex_table(io, df)
        end
    end
end

## Generate contributed listings

lastday = ""
lastam_pm = ""

open("contributed.tex", "w") do io
    for (location, am_pm, day) in Iterators.product(locations, am_pms, days)
        global lastday, lastam_pm
        df = subset(submissions, :Location => ByRow(==(location)), :AM_PM => ByRow(==(am_pm)), :Day => ByRow(==(day)); skipmissing = true)
        if (size(df, 1) > 0) && (df.Session[1] in contributed)
            if (day != lastday) || (am_pm != lastam_pm)
                println(io, "\\subsection{", nice_name[(day, am_pm)], "}\n")
                lastday = day
                lastam_pm = am_pm
            end
            latex_table(io, df)
        end
    end
end

## Generate poster listings

open("poster.tex", "w") do io
    println(io, "\\begin{itemize}")
    df = subset(submissions, :Session => ByRow(==("Poster")); skipmissing = true)
    for row in eachrow(df)
        title = replace(row.Title_of_presentation_or_poster, "&" => "\\&", "ℂ" => "\$\\mathbb{C}\$")
        allauthors = replace(row.all_names, "&" => "\\&")
        println(io, "\\item \\textit{$(title)}.")
        println(io, allauthors)
        println(io, "")
    end
    println(io, "\\end{itemize}\n")
end

## Website

WEBDIR = joinpath(@__DIR__, "content")

session_id = Dict([
    "Self-propulsion and fluid-body interactions" => "session34",
    "Asymptotics in active matter" => "session53",
    "Acoustics" => "session08",
    "Mathematical modelling in sport" => "session21",
    "Applied fluid dynamics" => "session46",
    "Blood and blood vessels" => "session48",
    "New mathematical approaches in the life sciences" => "session41",
    "Mathematics of energy" => "session09",
    "Thin films and contact lines" => "session31",
    "Metamaterial modelling and design" => "session50",
    "Mathematical ecology" => "session14",
    "Game theory and agent-based models" => "session05",
    "Controlling active matter" => "session12",
    "Droplets and impact" => "session07",
    "Poster" => "session54",
    "Evaporation" => "session47",
    "Analysis of continuum mechanics" => "session10",
    "Physiological flows and transport" => "session11",
    "Neurodynamics" => "session24",
    "Optimisation and control for nonlinear dynamics" => "session43",
    "Neurons and networks" => "session18",
    "Geophysics and climate" => "session30",
    "Filaments, membranes, and shells" => "session52",
    "Cell and tissue mechanics" => "session15",
    "Mathematical modelling of sleep and circadian rhythms: from molecular mechanisms to policy" => "session42",
    "Advances in water waves and free-surface flows" => "session01",
    "Advances in applied numerical linear algebra and its applications" => "session22",
    "Mathematical pharmacology" => "session13",
    "Stochastic processes and random walks" => "session36",
    "IMA Lighthill-Thwaites prize" => "session23",
    "Mathematical and computational ophthalmology" => "session20",
    "Collective behaviour and transport" => "session26",
    "Complex systems and control" => "session28",
    "Solid mechanics" => "session17",
    "Granular and multiphase flows" => "session51",
    "Mechanics of hydrogels and poroelastic media" => "session02",
    "Travelling waves" => "session38",
    "Sea ice modelling" => "session33",
    "Epidemiology and statistical learning" => "session45",
    "Networks and complex systems in society" => "session44",
    "Multiple wave scattering" => "session29",
    "Biofilms and pattern formation" => "session37",
    "Mathematical medicine" => "session27",
    "Dynamics of reaction-transport systems" => "session03",
    "How to be better prepared for a future pandemic: lessons learned from COVID-19, mpox and the four historic influenza pandemics" => "session04",
    "Cell modelling" => "session06",
    "Numerical methods" => "session16",
    "Industrial mathematics" => "session39",
    "Liquid crystals and transport models" => "session25",
    "Boundary layer flows and stability" => "session19",
    "Chemo-mechanical couplings in growing tissues" => "session32",
    "Microfluidics and flow in porous media" => "session40",
    "Modelling and inference in public health" => "session35",
    "Nonlinear dynamics and applications" => "session49"
])

## Generate individual files for each submission
for row in eachrow(submissions)
    if (row.Session != "Poster") && ismissing(row.Time)
        # Skip minisymposia and contributed talks without a time
        continue
    end
    if row.Session == "Poster"
        details = "Poster session"
        session = ""
    else
        details = "$(row.Time) $(nice_name[(row.Day, "")]) in $(row.Location)."
        session = "Part of the *[$(row.Session)]({{< relref \"/sessions/$(session_id[row.Session])\" >}})* session."
    end
    open(joinpath(WEBDIR, "talks", "talk$(lpad(row.ID, 3, "0")).md"), "w") do io
        println(io, """
        ---
        title: "$(row.Title_of_presentation_or_poster)"
        bookToc: false
        ---

        # $(row.Title_of_presentation_or_poster)

        **$(row.all_names)**

        $(details)

        $(session)

        ## Abstract

        $(row.Abstract)

        """)
    end
end

## Generate each session
for (name, id) in session_id
    open(joinpath(WEBDIR, "sessions", "$(id).md"), "w") do io
        if name in minisymposia.Title_of_minisymposium
            organisers = minisymposia[minisymposia.Title_of_minisymposium .== name, :Organisers][1]
            description = minisymposia[minisymposia.Title_of_minisymposium .== name, :Minisymposium_abstract][1]
            detail = """
            **Organisers:** $(organisers)

            **Minisymposium abstract**

            $(description)

            """
        else
            detail = "**Contributed talks**\n"
        end
        println(io, """
        ---
        title: "$name"
        bookToc: false
        ---

        # $name

        $detail
        """)
        df = sort!(subset(submissions, :Session => ByRow(==("$name")), :Time => ByRow(!ismissing); skipmissing = true), [:Day, :AM_PM, :Number])
        for row in eachrow(df)
            println(io, """
            ## [$(row.Title_of_presentation_or_poster)]({{< relref "/talks/talk$(lpad(row.ID, 3, "0"))" >}})

            **$(row.all_names)**

            $(row.Time) $(nice_name[(row.Day, "")]) in $(row.Location).

            """)
        end
    end
end

## Generate list of minisymposia

open(joinpath(WEBDIR, "programme", "minisymposia.md"), "w") do io
    println(io, """
    ---
    title: "Minisymposia"
    weight: 5
    ---

    # Minisymposia

    """)
    for row in eachrow(sort(minisymposia, :Title_of_minisymposium))
        println(io, "- [$(row.Title_of_minisymposium)]({{< relref \"/sessions/$(session_id[row.Title_of_minisymposium])\" >}}) ($(nice_name[(row.Day, row.Time)]) in $(row.Location))")
    end
end

## Generate list of contributed talks

open(joinpath(WEBDIR, "programme", "contributed.md"), "w") do io
    println(io, """
    ---
    title: "Contributed talks"
    weight: 6
    ---

    # Contributed talk sessions

    """)
    for row in sort(collect(contributed))
        # Get day/time of the contributed talk session
        df = subset(submissions, :Session => ByRow(==(row)); skipmissing = true)
        @assert all(df.Day .== df.Day[1])
        @assert all(df.AM_PM .== df.AM_PM[1])
        println(io, "- [$(row)]({{< relref \"/sessions/$(session_id[row])\" >}}) ($(nice_name[(df.Day[1], df.AM_PM[1])]) in $(df.Location[1]))")
    end
end

## Generate list of posters

open(joinpath(WEBDIR, "programme", "posters.md"), "w") do io
    println(io, """
    ---
    title: "Posters"
    weight: 7
    ---

    # Poster session

    """)
    for row in eachrow(sort(subset(submissions, :Session => ByRow(==("Poster")); skipmissing = true), :Title_of_presentation_or_poster))
        println(io, "- [$(row.Title_of_presentation_or_poster)]({{< relref \"/talks/talk$(lpad(row.ID, 3, "0"))\" >}})")
    end
end

## Detail of days

function markdown_table(io::IO, df)
    # Sanity checking
    @assert all(x -> x == df.Location[1], df.Location)
    @assert all(x -> x == df.Day[1], df.Day)
    @assert all(x -> x == df.AM_PM[1], df.AM_PM)
    @assert all(x -> x == df.Session[1], df.Session)
    # Sorting
    sort!(df, :Number)
    # Generate LaTeX table
    println(io, "### [$(df.Session[1])]({{< relref \"/sessions/$(session_id[df.Session[1]])\" >}}) (in $(df.Location[1]))\n")
    println(io, "| Time | Title | Authors |")
    println(io, "|:-----|:------|:--------|")
    for row in eachrow(df)
        title = replace(row.Title_of_presentation_or_poster, "|" => "\\|")
        allauthors = replace(row.all_names, "|" => "\\|")
        if row.Time !== missing
            println(io, "| $(row.Time) | [$(title)]({{< relref \"/talks/talk$(lpad(row.ID, 3, "0"))\" >}}) | $(allauthors) |")
        end
    end
    println(io, "")
end
markdown_table(df) = markdown_table(stdout, df)

for (day, am_pm) in [("MON", "AM"), ("MON", "PM"), ("TUE", "AM"), ("TUE", "PM"), ("WED", "AM")]
    open(joinpath(WEBDIR, "programme", "parallel", "$(lowercase(day))_$(lowercase(am_pm)).md"), "w") do io
        println(io, """
        ---
        title: "$(nice_name[(day, "")]) $(am_pm)"
        bookToc: false
        ---

        # $(nice_name[(day, am_pm)])

        ## Minisymposia
        """)
        for location in locations
            df = subset(submissions, :Location => ByRow(==(location)), :AM_PM => ByRow(==(am_pm)), :Day => ByRow(==(day)); skipmissing = true)
            if (size(df, 1) > 0) && (df.Session[1] in minisymposia.Title_of_minisymposium)
                markdown_table(io, df)
            end
        end
        println(io, "## Contributed talks\n")
        for location in locations
            df = subset(submissions, :Location => ByRow(==(location)), :AM_PM => ByRow(==(am_pm)), :Day => ByRow(==(day)); skipmissing = true)
            if (size(df, 1) > 0) && (df.Session[1] in contributed)
                markdown_table(io, df)
            end
        end
    end
end

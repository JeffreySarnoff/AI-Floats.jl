pushfirst!(LOAD_PATH, joinpath(@__DIR__, ".."))
using Documenter, FloatsForAI

makedocs(
    modules = [FloatsForAI],
    authors = "Jeffrey Sarnoff",
    repo = "https://github.com/JeffreySarnoff/FloatsForAI.jl/blob/{commit}{path}#{line}",
    sitename = "FloatsForAI.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://jeffreysarnoff.github.io/FloatsForAI.jl",
        repolink = "https://github.com/JeffreySarnoff/FloatsForAI.jl",
        edit_link = "main",
        assets = String[],
        sidebar_sitename = false,
    ),
    pages = [
        "Home" => "index.md",
        "User Guide" => "guide.md",
        "API Reference" => "reference.md",
        "Technical Information" => "technical.md",
    ],
    checkdocs = :none,
    linkcheck = true,
)

deploydocs(;
    repo = "github.com/JeffreySarnoff/FloatsForAI.jl.git",
    target = "build",
    devbranch = "main",
    push_preview = true,
)